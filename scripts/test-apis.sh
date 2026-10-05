#!/usr/bin/env bash
# test-apis.sh — smoke-test the external APIs the avatar_reel flow depends on.
# Usage: bash scripts/test-apis.sh [--audio] [--music]
#   (default)  free, read-only checks: auth, balance/quota, avatar look, models, voices
#   --audio    + Gemini TTS of one short line and ElevenLabs STS of it (a few seconds of audio)
#   --music    + one Kie.ai/Suno instrumental generation (~12 credits, ~40 s)
# Exit 0 = every check passed, 1 = at least one failed. Never prints secret values.
# Probe files go to scratch/api-test/ (git-ignored, per CONTRACT.md).
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT" || exit 2
[ -f .env ] && { set -a; . ./.env; set +a; }

DO_AUDIO=0; DO_MUSIC=0
for a in "$@"; do
  case "$a" in
    --audio) DO_AUDIO=1 ;;
    --music) DO_MUSIC=1 ;;
    *) echo "unknown option: $a"; exit 2 ;;
  esac
done

OUT="scratch/api-test"; mkdir -p "$OUT"
IDENTITY=".claude/skills/avatar-reel/identity.json"
KIE_KEY="${KIE_API_KEY:-${SUNO_KIE_API_KEY:-}}"
fail=0

ok()   { printf '  ok   %s\n' "$1"; }
bad()  { printf '  FAIL %s\n' "$1"; fail=$((fail+1)); }
warn() { printf '  warn %s\n' "$1"; }
# get <outfile> <url> [curl args...] → prints HTTP code
get()  { local o=$1 u=$2; shift 2; curl -sS -m 60 -o "$o" -w '%{http_code}' "$u" "$@" 2>/dev/null; }

echo "== Env"
for k in HEYGEN_API_KEY GEMINI_API_KEY ELEVENLABS_API_KEY; do
  [ -n "${!k:-}" ] && ok "$k set" || bad "$k missing"
done
[ -n "$KIE_KEY" ] && ok "KIE_API_KEY set" || warn "KIE_API_KEY missing (music is optional)"
[ -n "${AVATAR_GROUP_ID:-}" ] && ok "AVATAR_GROUP_ID set" || warn "AVATAR_GROUP_ID missing (needed once you have a trained avatar)"

echo "== HeyGen"
if [ -n "${HEYGEN_API_KEY:-}" ]; then
  H="x-api-key: $HEYGEN_API_KEY"
  c=$(get "$OUT/heygen_me.json" https://api.heygen.com/v3/users/me -H "$H")
  if [ "$c" = 200 ]; then
    ok "auth — wallet balance: $(jq -r '.data.wallet | "\(.remaining_balance) \(.currency)"' "$OUT/heygen_me.json")"
  else bad "GET /v3/users/me → HTTP $c"; fi
  c=$(get "$OUT/heygen_private.json" "https://api.heygen.com/v3/avatars/looks?ownership=private&limit=50" -H "$H")
  if [ "$c" = 200 ]; then
    n=$(jq '.data | length' "$OUT/heygen_private.json")
    nv=$(jq '[.data[] | select(.supported_api_engines | index("avatar_v"))] | length' "$OUT/heygen_private.json")
    [ "$n" -gt 0 ] && ok "private looks: $n ($nv with avatar_v)" || warn "no private avatar looks yet — train a digital twin first"
  else bad "GET /v3/avatars/looks → HTTP $c"; fi
  LOOK=$(jq -r '.identities[.default_owner].heygen_avatar_id' "$IDENTITY" 2>/dev/null)
  case "$LOOK" in
    ""|null|"<"*) warn "identity.json heygen_avatar_id is still a placeholder" ;;
    *)
      c=$(get "$OUT/heygen_look.json" "https://api.heygen.com/v3/avatars/looks/$LOOK" -H "$H")
      if [ "$c" = 200 ] && jq -e '.data.status == "completed" and (.data.supported_api_engines | index("avatar_v"))' "$OUT/heygen_look.json" >/dev/null; then
        ok "identity look ready for Avatar V ($(jq -r .data.name "$OUT/heygen_look.json"))"
      else bad "identity look not usable for Avatar V (HTTP $c, see $OUT/heygen_look.json)"; fi ;;
  esac
fi

echo "== Gemini"
GM_MODEL=$(jq -r '.identities[.default_owner].voice_generation_canon.gemini.model // "gemini-3.1-flash-tts-preview"' "$IDENTITY" 2>/dev/null)
GM_VOICE=$(jq -r '.identities[.default_owner].voice_generation_canon.gemini.voiceName // "Puck"' "$IDENTITY" 2>/dev/null)
if [ -n "${GEMINI_API_KEY:-}" ]; then
  c=$(get "$OUT/gemini_model.json" "https://generativelanguage.googleapis.com/v1beta/models/$GM_MODEL" -H "x-goog-api-key: $GEMINI_API_KEY")
  [ "$c" = 200 ] && ok "auth — model $GM_MODEL available" || bad "model $GM_MODEL → HTTP $c"
fi

echo "== ElevenLabs"
if [ -n "${ELEVENLABS_API_KEY:-}" ]; then
  E="xi-api-key: $ELEVENLABS_API_KEY"
  c=$(get "$OUT/el_sub.json" https://api.elevenlabs.io/v1/user/subscription -H "$E")
  if [ "$c" = 200 ]; then
    ok "auth — $(jq -r '"\(.tier): \(.character_count)/\(.character_limit) chars used, instant clone: \(.can_use_instant_voice_cloning)"' "$OUT/el_sub.json")"
  else bad "GET /v1/user/subscription → HTTP $c"; fi
  c=$(get "$OUT/el_voices.json" "https://api.elevenlabs.io/v2/voices?page_size=100" -H "$E")
  if [ "$c" = 200 ]; then
    nc=$(jq '[.voices[] | select(.category != "premade")] | length' "$OUT/el_voices.json")
    [ "$nc" -gt 0 ] && ok "cloned/custom voices: $nc" || warn "no cloned voice yet (only needed for gemini_tts_elevenlabs mode)"
  else bad "GET /v2/voices → HTTP $c"; fi
fi

echo "== Kie.ai (Suno)"
if [ -n "$KIE_KEY" ]; then
  K="Authorization: Bearer $KIE_KEY"
  c=$(get "$OUT/kie_credit.json" https://api.kie.ai/api/v1/chat/credit -H "$K")
  if [ "$c" = 200 ] && [ "$(jq -r .code "$OUT/kie_credit.json")" = 200 ]; then
    ok "auth — credits: $(jq -r .data "$OUT/kie_credit.json")"
  else bad "GET /api/v1/chat/credit → HTTP $c"; fi
fi

if [ "$DO_AUDIO" = 1 ]; then
  echo "== Audio (Gemini TTS → ElevenLabs STS)"
  jq -n --arg v "$GM_VOICE" '{
    contents: [{parts: [{text: "Audio Profile: A creator recording a quick test.\n\nDirector'\''s Notes:\n- Style: Casual\n- Pacing: Clear\n\nTranscript:\nThis is a short voice test for the avatar reel."}]}],
    generationConfig: {responseModalities: ["AUDIO"], speechConfig: {voiceConfig: {prebuiltVoiceConfig: {voiceName: $v}}}}
  }' > "$OUT/tts_req.json"
  c=$(curl -sS -m 120 -o "$OUT/tts_resp.json" -w '%{http_code}' -X POST \
    "https://generativelanguage.googleapis.com/v1beta/models/$GM_MODEL:generateContent" \
    -H "x-goog-api-key: ${GEMINI_API_KEY:-}" -H "Content-Type: application/json" --data @"$OUT/tts_req.json")
  if [ "$c" = 200 ] && jq -e '.candidates[0].content.parts[0].inlineData.data' "$OUT/tts_resp.json" >/dev/null; then
    rate=$(jq -r '.candidates[0].content.parts[0].inlineData.mimeType' "$OUT/tts_resp.json" | grep -oE 'rate=[0-9]+' | cut -d= -f2)
    jq -r '.candidates[0].content.parts[0].inlineData.data' "$OUT/tts_resp.json" | base64 -d > "$OUT/tts.pcm"
    ffmpeg -y -loglevel error -f s16le -ar "${rate:-24000}" -ac 1 -i "$OUT/tts.pcm" -b:a 128k "$OUT/tts_test.mp3"
    ok "Gemini TTS → $OUT/tts_test.mp3 ($(ffprobe -v error -show_entries format=duration -of csv=p=0 "$OUT/tts_test.mp3") s)"
    EL_VOICE=$(jq -r '.identities[.default_owner].elevenlabs_voice_id' "$IDENTITY" 2>/dev/null)
    case "$EL_VOICE" in ""|null|"<"*) EL_VOICE=$(jq -r '.voices[0].voice_id' "$OUT/el_voices.json" 2>/dev/null) ;; esac
    c=$(curl -sS -m 120 -o "$OUT/sts_test.mp3" -w '%{http_code}' -X POST \
      "https://api.elevenlabs.io/v1/speech-to-speech/$EL_VOICE?output_format=mp3_44100_128" \
      -H "xi-api-key: ${ELEVENLABS_API_KEY:-}" -F "audio=@$OUT/tts_test.mp3" -F "model_id=eleven_multilingual_sts_v2")
    [ "$c" = 200 ] && ok "ElevenLabs STS → $OUT/sts_test.mp3" || bad "ElevenLabs STS → HTTP $c"
  else bad "Gemini TTS → HTTP $c (see $OUT/tts_resp.json)"; fi
fi

if [ "$DO_MUSIC" = 1 ] && [ -n "$KIE_KEY" ]; then
  echo "== Music (Kie.ai Suno, ~12 credits)"
  c=$(curl -sS -m 60 -o "$OUT/kie_create.json" -w '%{http_code}' -X POST https://api.kie.ai/api/v1/jobs/createTask \
    -H "$K" -H "Content-Type: application/json" \
    -d '{"model":"ai-music-api/generate","input":{"model":"V6_MINI","custom_mode":true,"instrumental":true,"title":"API test","style":"Lo-fi, uplifting, soft piano, light drums, 95 BPM","negative_tags":"Vocals"}}')
  T=$(jq -r '.data.taskId // empty' "$OUT/kie_create.json")
  if [ "$c" = 200 ] && [ -n "$T" ]; then
    s=""
    for _ in $(seq 1 30); do
      sleep 10
      curl -sS -m 30 -o "$OUT/kie_poll.json" "https://api.kie.ai/api/v1/jobs/recordInfo?taskId=$T" -H "$K"
      s=$(jq -r '.data.state' "$OUT/kie_poll.json"); case "$s" in success|fail) break ;; esac
    done
    if [ "$s" = success ]; then
      url=$(jq -r '.data.resultJson | fromjson | .data[0].audio_url' "$OUT/kie_poll.json")
      curl -sS -m 120 -A "Mozilla/5.0" -o "$OUT/music_test.mp3" "$url" \
        && ok "Suno → $OUT/music_test.mp3 ($(jq -r .data.creditsConsumed "$OUT/kie_poll.json") credits)" \
        || bad "music download failed"
    else bad "Kie task ended in state '$s' (see $OUT/kie_poll.json)"; fi
  else bad "Kie createTask → HTTP $c: $(jq -c . "$OUT/kie_create.json" 2>/dev/null)"; fi
fi

echo "== Result"
if [ "$fail" -eq 0 ]; then echo "  OK — all checks passed."; exit 0; fi
echo "  $fail check(s) failed."; exit 1

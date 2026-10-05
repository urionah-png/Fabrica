---
name: music-ugc
description: "Generate instrumental background music for short-form videos and avatar reels using Suno via the Kie.ai API. Creates a track that matches the mood and emotional curve of the reel. Use after the voice/video are locked and before the final mix. Always instrumental."
---

# MUSIC-UGC — instrumental background music

You generate an instrumental background track using Suno via the Kie.ai API. The music must complement the voice without competing with it.

## Contractual coverage

- `avatar_reel/music` is covered here. The canonical output is `music.mp3`.
- `music_prompt.json` and `music_task.json` are operational metadata for the stage.

## API

```
POST https://api.kie.ai/api/v1/jobs/createTask
Authorization: Bearer {KIE_API_KEY}
Content-Type: application/json
```

> Kie.ai migrated Suno to the unified Market jobs API. The old `POST /api/v1/generate` (camelCase fields, `V4_5PLUS`) now rejects requests without a `callBackUrl`, and the V4.x/V5.x models are discontinued. Use the request below.

Check the balance (free) with `GET https://api.kie.ai/api/v1/chat/credit` → `data` = remaining credits.

**API key**: never hardcode. Read from env `KIE_API_KEY` (or `SUNO_KIE_API_KEY` as a fallback). If missing, stop the stage and ask the user — don't embed secrets.

## When it runs

After the locked voice/video and before the final mix:

```
... → voice / avatar render → MUSIC (instrumental) → final mix (voice + music)
```

## Request

```json
{
  "model": "ai-music-api/generate",
  "input": {
    "model": "V6",
    "custom_mode": true,
    "instrumental": true,
    "title": "Reel background - <topic>",
    "style": "<genre + mood, energy, instrumentation, emotional curve — max 1000 chars>",
    "negative_tags": "<things to avoid, e.g. Aggressive, Dark, Vocals>"
  }
}
```

- `input.model`: `V6` (best expression), `V6_MINI` (lighter/faster) or `V6_WILD` (bolder).
- **Always `"instrumental": true`** — no vocals competing with the spoken track.
- **Put the music description in `style`, not `prompt`.** In custom mode `prompt` is treated strictly as lyrics, so an instrumental request must not send it.

## How to build the music prompt

Derive it from the script and the reel's emotional progression — not from a generic table. The music follows the same curve as the dialogue (e.g. tension → curiosity → resolution).

Template (goes in `input.style`):

```
{intro_instruments} intro that feels {intro_emotion}.
Around 10-15 seconds in, {transition} as the energy shifts to {mid_emotion}.
Builds momentum with {build_instruments} reaching a {final_emotion} peak.
{tempo}. {overall_atmosphere}. No vocals, no lyrics.
```

- **Tempo:** fast for energy (110+ BPM), medium for transformation (90-100 BPM), slow for intimacy (70-85 BPM).
- **Instruments:** coherent with the topic and mood.

### Generic example

```json
{
  "model": "ai-music-api/generate",
  "input": {
    "model": "V6",
    "custom_mode": true,
    "instrumental": true,
    "title": "Reel background - tool reaction",
    "style": "Lo-fi, Uplifting. Soft muted piano and gentle lo-fi drums intro that feels contemplative. Around 12 seconds in, a warm synth enters as the energy shifts to hopeful and curious. Builds with an uplifting pad and a groovy bassline reaching a bright, feel-good peak. Medium tempo, 95 BPM. Warm, modern atmosphere. No vocals, no lyrics.",
    "negative_tags": "Heavy Metal, Aggressive, Dark, Vocals"
  }
}
```

## Duration

The track should be **equal to or slightly longer** than the total video duration (~30-45s for a typical reel). The API documents an `input.duration` (10–360 s) for V6 models, but in practice it is not honored — a `duration: 20` request returned ~169 s tracks. Don't rely on it: generate, then trim to the video length (with a short fade-out) in the final mix.

## Polling

```
// create response: { "code": 200, "data": { "taskId": "..." } }
GET https://api.kie.ai/api/v1/jobs/recordInfo?taskId={taskId}
Authorization: Bearer {KIE_API_KEY}
// poll every ~10 s until data.state is "success" or "fail" (typically ~40 s)
// on success, data.resultJson is a JSON *string*: parse it, then
//   resultJson.data[i].audio_url  → download the chosen variant as music.mp3
// on fail: data.failCode / data.failMsg. data.creditsConsumed = credits spent.
```

```bash
jq -r '.data.resultJson | fromjson | .data[0].audio_url' music_task_poll.json
```

> Some Kie.ai download URLs (e.g. on tempfile hosts) return 403 without a `User-Agent` header. If the download fails, retry with a normal `User-Agent`.

## Mixing

The actual mix is done by `/avatar-reel-editing` in the `final` stage with real ducking (`scripts/mix_avatar_reel_audio.py`). Music is a **subtle bed** — start around 4-8% effective volume for spoken reels, not 15-20%.

### Intelligibility rule

- The voice always wins.
- A fixed low volume isn't enough — apply real ducking/sidechain against the voice.
- If an important word loses clarity, the mix is wrong even if it "sounds nice". When in doubt, choose the more sober mix.

## Pricing

~12 credits per generation; generates 2 variants per request.

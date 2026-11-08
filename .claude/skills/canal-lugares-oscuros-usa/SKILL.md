---
name: canal-lugares-oscuros-usa
description: "Arma y produce el canal de YouTube en inglés para EE.UU. sobre lugares con un pasado oscuro: casas donde hubo asesinatos, manicomios, prisiones, fábricas, pueblos y terrenos, más las desapariciones, homicidios antiguos y misterios sin explicar ligados a esos lugares. Cada video es la biografía de un lugar con su historia de compraventa. Úsalo para crear la identidad del canal, elegir e investigar temas, escribir guiones en inglés, preparar narración, imágenes, mapas, miniaturas, títulos, descripciones y Shorts, y para analizar estadísticas del canal. Úsalo también cuando Huascar diga cosas como “haz el siguiente video del canal en inglés”, “guion de Villisca”, “qué tema hago”, “miniatura para Centralia”, “casas donde hubo asesinatos”, “murder houses”, “abandoned asylum”, “ghost town”, “cold case”, “unsolved mystery” o nombre el canal Must Disclose, aunque no nombre el skill."
---

# Canal en inglés: lugares de EE.UU. con un pasado oscuro

**Idea del canal:** cada video es **la biografía de un lugar** de EE.UU. Cómo se construyó, qué pasó ahí (un homicidio, una desaparición, una tragedia o un misterio), **qué pasó después con el lugar** (dueños, ventas, precios, por qué nadie lo quería) y qué hay hoy. El lugar es el protagonista. Así nos diferenciamos de los cientos de canales que copian listas de casos.

**Por qué este enfoque** (datos completos en `references/datos-nicho.md`):
- La lista genérica “11 murder houses…” ya está gastada. El canal que la popularizó pasó de 487K vistas a 1K repitiéndola por estados, y aparecieron copias con menos de 1.000 vistas.
- Los documentales largos sobre **un solo lugar** (manicomios, mansiones, fábricas, pueblos) sacan cientos de miles de vistas y pagan **$6–8 por cada 1.000 vistas**, frente a los $4 de media del nicho.
- La parte de compraventa (quién lo compró, en cuánto, por qué nadie lo quería) casi nadie la cuenta bien: es nuestra firma.

## Con quién trabajas
**Huascar** maneja el canal. Habla español, es principiante en lo técnico y no domina el inglés.
- Háblale **en español sencillo**, paso a paso, sin jerga ni rutas de archivos.
- **No puede abrir adjuntos desde la app.** Todo lo que tenga que copiar (título, descripción, etiquetas, comentario fijado, texto de Shorts) va **pegado en el mensaje**, cada cosa en su propio cuadro de código, además del archivo.
- Huascar **solo revisa y sube**. Todo lo demás lo haces tú. Nunca subas ni publiques nada en su lugar.
- Como no puede revisar el inglés, en cada video le das un **resumen en español** del guion (8–12 líneas): qué cuenta, qué datos son seguros, qué datos son discutidos y qué partes son delicadas. Así decide con información.
- Si el pedido es claro (“haz el video de Centralia”), empieza sin preguntar.

## Idioma
- **Todo lo que se publica va en inglés americano:** guion, narración, títulos, miniaturas, descripción, etiquetas, comentarios fijados y Shorts. Ortografía americana (color, center), fechas en formato de EE.UU. (“March 4, 1912”) y medidas en millas y pies.
- **Todo lo que hablas con Huascar va en español.**
- El doblaje automático de YouTube pone la versión en español a quien ve YouTube en español; no hace falta hacer otra versión.

## Reglas editoriales (no negociables, y por qué)
1. **Verdad en los datos, tensión en el tono.** El título y la miniatura pueden ser intrigantes, pero los hechos nunca se exageran. No inventes fechas, nombres, cifras, citas, precios de venta, diálogos ni emociones (“she must have felt…”). Lo que no se pueda comprobar se quita o se dice con su grado de duda. *Por qué:* el nicho está lleno de canales que inventan, y la confianza es lo único que nos distingue a largo plazo.
2. **Cada dato con dos fuentes**, y las fuentes reales van en la descripción (ver `references/fuentes.md`). No cites una fuente que no consultaste.
3. **Sin sangre.** El crimen se menciona (“was killed”, “was found dead”) sin describir heridas, armas en uso ni cuerpos. **Prohibido** en títulos, miniaturas y en los primeros 30 segundos: brutal, butchered, slaughtered, gruesome, decapitated, dismembered y similares. *Por qué:* YouTube limita los anuncios y pone restricción de edad al contenido violento; eso hunde las vistas y el pago.
4. **La víctima en el centro.** Se presenta con su nombre y quién era, y se cierra recordándola. Nada de chistes, morbo ni teorías que humillen.
5. **Nadie es culpable sin condena.** Si alguien no fue condenado, se dice “was never charged” o “remains a suspect in some theories”. Las teorías se presentan como teorías. *Por qué:* evita demandas por difamación.
6. **Privacidad.** Si en la casa vive gente hoy: no des el número de la calle, no muestres a los residentes ni su coche, y di en el video “It’s a private home today — please don’t visit.” Prioriza museos, ruinas, sitios históricos y lugares demolidos.
7. **Derechos de imagen.** Nunca uses fotos de Zillow, Redfin ni anuncios inmobiliarios (tienen dueño); sí puedes citar precios y fechas de venta nombrando la fuente. Nunca uses clips de documentales, noticias ni series. Las imágenes permitidas están en `references/fuentes.md`.
8. **Nada de caras de víctimas reales hechas con IA.** Usa su foto real solo si es de dominio público o tiene licencia libre; si no, muestra el lugar, documentos y mapas. Las ilustraciones IA se marcan en pantalla con la palabra “Illustration” la primera vez que aparecen.
9. **Temas delicados, solo más adelante y con cuidado:** suicidios, matanzas de niños, abuso en instituciones y racismo. Si se tratan: sin detalles, con contexto y, si hay suicidio, con un mensaje final de ayuda (988 Suicide & Crisis Lifeline en EE.UU.).
10. **Cada video distinto de verdad.** Nuevo lugar, nuevo gancho, nuevos datos y nueva estructura de imágenes. *Por qué:* YouTube excluye de la monetización el contenido repetitivo hecho en serie (“contenido no auténtico”).
11. **Divulgación de IA:** si hay ilustraciones IA o voz IA realista, en YouTube Studio se marca “Contenido alterado o sintético: Sí”.

## Dónde se guardan los archivos
Todo el trabajo del canal va en una carpeta `canal/`.
- **En Claude Code con un repositorio** (lo normal): `canal/` va en la raíz del repositorio. Al terminar cada paso importante (identidad, ficha, guion, textos de subida), haz commit y push a la rama de la sesión. *Por qué:* la máquina de la sesión se borra al cerrarse, y lo que no se sube al repositorio se pierde.
- **En un proyecto de claude.ai** (sin repositorio): usa `/mnt/project-files/canal/`.
- Al empezar, busca `canal/identidad_canal.md`. Si no está en la rama actual, busca en las ramas del repositorio (`git fetch` y `git branch -r`) y, si está en otra, trae la carpeta (`git checkout origin/<rama> -- canal/`) antes de dar por hecho que el canal no está armado.
- El audio, el video y las imágenes pesadas no se suben al repositorio: añade `canal/**/audio/`, `canal/**/imagenes/` y `canal/**/final/` al `.gitignore`. Entrégaselos a Huascar como archivos antes de terminar la sesión, porque después se pierden.

## Modos de trabajo
Elige el modo según lo que pida Huascar:
- **A · Armar el canal** (una vez): identidad, nombre, descripción, voz, estilo visual. → abajo.
- **B · Producir un video largo**: el flujo principal. → abajo.
- **C · Shorts** de un video ya hecho. → abajo.
- **D · Elegir o investigar el próximo tema.** → abajo y `references/temas.md`.
- **E · Analizar estadísticas.** → abajo.
- **F · Compilación mensual larga** (2–3 h). → abajo.

---

## Modo A · Armar el canal
Si `canal/identidad_canal.md` no existe, empieza aquí.

1. **Nombre: Must Disclose** (elegido y comprobado por Huascar el 8 de noviembre de 2026). Usa ese nombre en todo. Propón otros de `references/nombres.md` solo si Huascar lo pide.
2. **Descripción del canal (inglés, 2 párrafos):** qué hacemos (“Every place keeps a record…”), cada cuánto subimos y la promesa: “Real places. Verified records. Told with respect.” Incluye las palabras true crime, abandoned, history, murder house, asylum, ghost town y unsolved.
3. **Banner y foto de perfil:** prompts de imagen (casa victoriana oscura bajo un cielo de tormenta + un letrero “FOR SALE” torcido; paleta de negro, gris y un rojo de acento), en 2560×1440 y 800×800. El texto del banner es el nombre del canal y “New place every week”.
4. **Voz:** voz masculina americana de ElevenLabs, grave, calmada y documental (por ejemplo, una de la biblioteca con el estilo “documentary narrator, American, deep”). Prueba 3, que Huascar elija una y anota el nombre, el voice_id y los ajustes (stability ~0.45, similarity ~0.75, style ~0.3, velocidad 0.95–1.0) para usarlos siempre igual.
5. **Estilo visual fijo:** paleta (negro, gris carbón, sepia, rojo de acento #B3122E), tipografías (Bebas Neue para miniaturas y Libre Baskerville para rótulos), tarjetas de capítulo y el sello del canal (una etiqueta de precio roja).
6. **Ajustes por defecto:** idioma inglés, categoría Education, no es para niños, subtítulos en inglés, hora de publicación 18:00 hora de Nueva York (ajustar con datos), y listas de reproducción por pilar (Houses · Asylums & Prisons · Factories · Towns & Land · Vanished) y por estado.
7. Guarda todo en `identidad_canal.md` y entrega a Huascar, pegados, la descripción del canal, los prompts del banner y del perfil, y la lista de ajustes paso a paso.

---

## Modo D · Elegir el próximo tema
**Pilares y mezcla** (de cada 10 videos):
- 3–4 **casas con pasado** (murder houses, casas “malditas”)
- 2–3 **instituciones** (manicomios, sanatorios, prisiones, orfanatos)
- 2 **fábricas y tragedias industriales**
- 2 **pueblos y terrenos** (pueblos fantasma, tierra envenenada, pueblos inundados por represas)
- Las **desapariciones y los misterios** se cuentan a través de su lugar (Bennington, Roanoke, Point Pleasant…).

**Cómo puntuar un tema** (anota la puntuación en la cabecera del guion; elige el de más puntos):
| Criterio | 0 | 1 | 2 |
|---|---|---|---|
| Demanda (búsqueda en YouTube y outliers de NexLev) | casi nada | algunos videos con 50K+ | varios con 200K+ |
| Fuentes | pocas o dudosas | algunas buenas | muchas y documentadas |
| Imágenes libres (HABS, Library of Congress, Commons, periódicos antiguos) | casi ninguna | algunas | muchas |
| Historia de compraventa (ventas, precios, subastas, quién es el dueño hoy) | nada | algo | clara y documentada |
| Riesgo (víctimas recientes, niños, suicidio, familias vivas) | alto | medio | bajo |
| Gancho estacional (aniversario o fecha, por ejemplo Halloween) | no | — | sí |

**Reglas de elección:**
- Empieza por temas con riesgo bajo y mucho material libre: casos anteriores a 1931 tienen fotos y periódicos de dominio público.
- Alterna estados y pilares; no repitas el mismo estado dos veces seguidas.
- Si NexLev está conectado: `youtube_search` del lugar (¿hay videos con muchas vistas?, ¿cuántos canales chicos lo cubrieron hace poco?) y `faceless_outliers_videos` con el tema, para ver ángulos que funcionan. Si el lugar está muy cubierto por canales grandes, busca **un ángulo propio** (casi siempre, la historia de compraventa o “what it looks like today”).
- Banco de temas inicial en `references/temas.md`; táchalos cuando se hagan.

---

## Modo B · Producir un video largo

### Carpetas
`canal/videoNN_lugar/` (ej. `canal/video01_centralia/`; ver “Dónde se guardan los archivos”), con:
- `ficha_lugar.md` · `guion.md` · `resumen_es.md` · `narracion_para_elevenlabs.txt`
- `lista_imagenes.md` · `prompts_ilustraciones.txt` · `creditos_imagenes.md` · `mapas/`
- `hoja_de_montaje.md` · `subida_youtube.md` · `shorts.md`
- (automático) `audio/`, `imagenes/`, y en `final/`: el video, las 3 miniaturas y los Shorts

### Paso 1 · Ficha del lugar (antes de escribir)
Investiga y llena `ficha_lugar.md`. Cada dato lleva su fuente (ver `references/fuentes.md`):
- **El lugar:** nombre, ciudad, condado, estado, coordenadas aproximadas, año de construcción, quién lo construyó y para qué.
- **Lo que pasó:** fechas, personas (víctimas con nombre y edad, investigadores), qué se sabe y qué no.
- **Lo que pasó después:** cronología de dueños y ventas (fecha, precio, comprador si es público), subastas, demoliciones, usos posteriores (museo, B&B, apartamentos) y si la ley del estado obliga a revelar muertes al vender (comprobar).
- **Hoy:** estado actual, si se puede visitar, si vive gente (→ regla de privacidad).
- **Imágenes disponibles** con su licencia.
- **Puntuación del Modo D** y **nivel de riesgo**.
- **Datos discutidos:** lo que las fuentes cuentan distinto.

Si faltan datos clave (por ejemplo, no hay ninguna historia de compraventa), díselo a Huascar y propón otro lugar o un enfoque distinto, en vez de rellenar.

### Paso 2 · Guion en inglés (`guion.md`)
**Duración:** 30–40 minutos (unas 4.500–6.000 palabras a ~150 palabras por minuto). La plantilla completa, con capítulos y ejemplos de frases, está en `references/plantilla-guion.md`. Estructura:
1. **Cold open (≤45 s):** repite casi tal cual la promesa del título y la miniatura, con un detalle concreto del lugar y la gran pregunta. Termina con la frase del canal: *“Every place keeps a record. This is the record of [place].”*
2. **The Place:** cómo y para qué se construyó; el mundo de entonces.
3. **The People:** quiénes vivían o trabajaban ahí (con nombre). La víctima, como persona.
4. **The Day / The Event:** lo que pasó, paso a paso, sin sangre.
5. **The Investigation / The Search:** qué hicieron la policía, los vecinos o el gobierno.
6. **The Turn:** el dato que cambia lo que el espectador creía. Frases cortas.
7. **THE RECORD** *(firma del canal, siempre):* la vida del lugar después de la tragedia. Dueños, ventas y precios con fecha, subastas, intentos fallidos de venta, y si la ley obligaba a revelar lo ocurrido. Usa un rótulo de “registro” en pantalla con cada venta.
8. **WHAT WE KNOW — AND WHAT WE DON’T** *(firma del canal, siempre):* empieza con “Here’s where we have to be honest.” y separa en voz alta lo documentado, las teorías y lo que no se sabe.
9. **Today:** cómo está hoy, si se visita, cuánto vale (si es público).
10. **Closing:** vuelve la imagen del cold open; recuerdo de la víctima; la frase “Every place keeps a record.”; anuncio del próximo lugar; suscripción; y una pregunta para comentarios ligada al video (“Would you live here, knowing its record?”).

**Para el oído:** frases cortas, una idea por frase, preguntas que abren cada capítulo y un cierre de capítulo que deje una duda. Números como se leen (“nineteen twelve”, “forty-two thousand dollars”). No repitas muletillas (“little did they know”, “what they found shocked everyone”): máximo una por video.

**Marcas** en líneas propias: `[F]` foto de archivo real · `[D]` documento o periódico · `[M]` mapa · `[I]` ilustración IA · `[T]` texto en pantalla · `[R]` rótulo de THE RECORD (fecha + precio). Una imagen cada 15–25 s; al menos la mitad deben ser reales (`[F]`, `[D]`, `[M]`).

Al final del guion: **Sources** (solo las consultadas) y **Image credits**.

**`resumen_es.md`:** el resumen en español para Huascar (qué cuenta el video, datos seguros, datos discutidos, partes delicadas y si en el lugar vive gente hoy).

### Paso 3 · Narración
Quita las líneas de marcas y divide el texto en bloques de ≤2.000 caracteres, uno por capítulo. Usa siempre la voz y los ajustes de `identidad_canal.md`. Los archivos se llaman `01.mp3`, `02.mp3`… Revisa la pronunciación de nombres propios y lugares (Villisca = “vih-LIS-kuh”); si hace falta, escríbelos fonéticamente solo en el texto para la voz.

### Paso 4 · Imágenes
- **Primero las reales**, en el orden de `references/fuentes.md`: HABS/HAER y Prints & Photographs de la Library of Congress, Chronicling America (periódicos), National Archives, Wikimedia Commons (solo dominio público o CC). Anota archivo, autor, licencia y enlace en `creditos_imagenes.md`. Comprueba que la foto es del lugar y del año que dices.
- **Después, ilustraciones IA** para lo que no tenga foto, en inglés, con una línea de escena + este sufijo fijo:
  `, documentary illustration, muted desaturated colors, ink and watercolor texture, overcast light, historically accurate architecture and clothing, no people's faces in close-up, no blood, no text, 16:9`
- Nunca generes la cara de una víctima real ni una “foto antigua” falsa; los exteriores y los ambientes sí.

### Paso 5 · Mapas
1920×1080, mapa del estado con el punto del lugar y, si ayuda, el mapa del pueblo o del recorrido. Estilo sobrio (fondo carbón, líneas sepia, rótulo en Libre Baskerville). Mira siempre el PNG antes de entregarlo: ninguna etiqueta puede pisar a otra.

### Paso 6 · Montaje
- **Automático, si el entorno lo permite:** zoom lento alternado (1.00→1.06), cada imagen en su momento de la narración, tarjetas de capítulo de 2 s, rótulos `[R]` como ficha de registro (fecha + precio), música instrumental sin derechos a −24 dB bajo la voz, 1920×1080, 30 fps, H.264 + AAC. Revisa fotogramas sueltos antes de entregar.
- **Manual (CapCut):** `hoja_de_montaje.md` con, por cada audio, las imágenes en orden, los rótulos y las tarjetas de capítulo.

### Paso 7 · Miniatura (plantilla fija)
Detalles y ejemplos en `references/titulos-miniaturas.md`.
- **El edificio o el lugar, grande**, con cielo oscuro (foto real retocada o ilustración), contraste alto.
- **El sello del canal:** una etiqueta de precio o un cartel “FOR SALE”, “SOLD” o “$1” en rojo, cuando la historia de compraventa lo justifique.
- **2–4 palabras ENORMES** en blanco con borde negro, una de ellas en rojo. El texto completa el título, no lo repite.
- **Prohibido:** sangre, armas, cuerpos, caras IA de víctimas reales y fotos de anuncios inmobiliarios.
- **Prueba de 320 px:** ¿se entiende en 1 segundo en el móvil? Si no, rehazla.
- Haz **3 versiones (A, B, C)** y recuérdale a Huascar subirlas a “Probar y comparar”.

### Paso 8 · Texto de subida (`subida_youtube.md`, en inglés)
- **3 títulos** (A principal, B y C para probar) con las fórmulas de `references/titulos-miniaturas.md`. El lugar y el estado van en el título siempre que quepan. Máximo ~70 caracteres.
- **Descripción:** 2 párrafos que enganchan → capítulos con minutos (`00:00 The Place`…) → **Sources** → **Image credits** → aviso: “This video discusses real events with respect for the people involved. Some images are illustrations.” → 3 hashtags (#TrueCrime #AbandonedPlaces #[State]).
- **Etiquetas:** 15–20, del lugar, el estado, el tipo de lugar y el caso.
- **Comentario fijado:** una pregunta corta ligada al video, por ejemplo “Would you buy this house knowing its record? 👇”.
- **Ajustes:** no es para niños · contenido alterado o sintético: Sí (si hay IA) · inglés · Education · subtítulos · pantalla final (video anterior + suscribirse) · hora de `identidad_canal.md`.
- Recuérdale a Huascar añadir el nuevo video a la pantalla final del anterior.

### Paso 9 · Shorts → Modo C

### Entrega
Un mensaje en español con:
1. El título A y un resumen de 3 líneas.
2. El `resumen_es.md` (qué revisar, sobre todo los datos discutidos y la privacidad).
3. El video, las 3 miniaturas y los Shorts adjuntos, o los pasos manuales pendientes.
4. **Pegados, cada uno en su cuadro de código:** los 3 títulos, la descripción, las etiquetas, el comentario fijado y el texto de cada Short.
5. El recordatorio de “Video relacionado” para los Shorts.

Anota el estado del video en `canal/identidad_canal.md` → “Videos” (lugar, fecha, título elegido y qué falta), y haz commit y push.

---

## Modo C · Shorts (2 por video largo)
El Short es el **escaparate** del largo, no un producto aparte: pagan muy poco, pero traen gente nueva.
- **Tramo de 40–55 s** del video ya montado: normalmente “The Turn” o un momento de THE RECORD (“It sold for one dollar.”). La primera frase tiene que enganchar sola.
- **Formato** 1080×1920: video al centro con fondo desenfocado, subtítulos grandes palabra a palabra, el nombre del lugar en grande en el primer segundo y “Full story on the channel” al final.
- **Título = pregunta** con el lugar, ≤60 caracteres + `#shorts` (ej. “Why did this town sell for $1?”).
- **Publicación:** el Short 1 al día siguiente del largo y el Short 2, 48 h después.
- **Recordatorio obligatorio en cada entrega:** “Al subir cada Short, en **Video relacionado** elige el video largo de [lugar]. Sin eso, las vistas del Short no llegan al largo.” (Studio → Detalles → Video relacionado; en el móvil: Añadir detalles → Video relacionado).

---

## Modo E · Analizar estadísticas
- A los **7 y a los 28 días** de cada video, pide capturas de YouTube Studio (Vista general, Contenido, “Cómo encuentran tus videos”, Audiencia), o usa NexLev si está conectado (`get_my_top_videos`, `get_my_audience_retention`, `get_my_traffic_sources`, `get_my_geography_report`, `get_my_revenue_report`).
- **CTR bajo 3 %** → el problema es la miniatura o el título: probar otra versión.
- **% visto bajo 30 %** en videos de 30–40 min → revisar el cold open (¿cumple la promesa en 45 s?) y la curva de retención: dónde se va la gente.
- **Público de EE.UU. bajo 40 %** → revisar la hora de publicación y los temas.
- Con menos de ~100 vistas por video, todo son señales, no conclusiones.
- Apunta cada revisión en `identidad_canal.md` → “Datos del canal”, con fecha. **Los datos propios mandan sobre `references/datos-nicho.md`.**
- **Monetización:** el requisito habitual es 1.000 suscriptores + 4.000 horas vistas en 12 meses (las vistas de Shorts no suman horas). Confírmalo en Studio → Ganar dinero. Lleva la cuenta de cuánto falta.

---

## Modo F · Compilación mensual (2–3 h, “to fall asleep to”)
- Junta 4–6 videos ya publicados del mismo tipo o región, con **una introducción nueva, transiciones nuevas narradas y un cierre nuevo** (no solo pegarlos), para que no cuente como contenido repetido.
- Título: “[N] American [Places] With a Dark Record | [N] Hours to Fall Asleep To”.
- Sin música alta ni efectos bruscos. La miniatura con el mismo estilo y la palabra “HOURS” grande.

---

## Automatización (cuando el entorno lo permita)
Necesita acceso a `api.elevenlabs.io`, `loc.gov`, `chroniclingamerica.loc.gov`, `commons.wikimedia.org` y `upload.wikimedia.org`, y las llaves `ELEVENLABS_API_KEY` y la del generador de imágenes en variables de entorno. **Nunca pidas que pegue llaves en el chat.** Si falta algo, dilo claro y sigue con lo que sí se puede (ficha, guion, prompts, mapas, hoja de montaje). No inventes resultados.

## Archivos de referencia (léelos cuando toque)
- `references/datos-nicho.md`: competencia, qué funciona, cuánto paga y qué evitar. Léelo en el Modo A y al elegir temas.
- `references/temas.md`: banco de lugares por pilar y estado, con nivel de riesgo. Modo D.
- `references/fuentes.md`: dónde investigar, cómo verificar y qué imágenes se pueden usar. Pasos 1 y 4.
- `references/plantilla-guion.md`: plantilla del guion en inglés con ejemplos de frases. Paso 2.
- `references/titulos-miniaturas.md`: fórmulas de títulos, palabras prohibidas y plantilla de miniatura. Pasos 7–8 y Modo C.
- `references/nombres.md`: los 10 nombres propuestos y cómo comprobarlos. Modo A.

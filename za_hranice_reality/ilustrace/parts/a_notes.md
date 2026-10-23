# Share A: dreamSignGrid, fadingTrace, brainMap, remRebound, loopRoom, rewriteScript

## What was verified

Harness: `/tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/art_harness_a/`
(scratchpad, not committed). It holds a mock `AppSkin` with the day and night (redOnly) palettes from the brief,
`paintText` (vertical centre at `at.dy`, `align` 0 / 0.5 / 1), the `_Art` base copied verbatim, the sample `_Forgetting`
and `lib/a_classes.g.dart` = `part of 'art.dart';` + `a_classes.dart` unchanged (made by `sync.sh`).

- **Flutter 3.27.4 / Dart 3.6.2**, `flutter analyze`: **No issues found.**
  Lints: `flutter_lints` 5.0.0 + `prefer_const_constructors`, `prefer_final_locals`, `avoid_redundant_argument_values`,
  `unnecessary_parenthesis`, plus `strict-casts` and `strict-raw-types`.
  The brief's own sample `_Forgetting` trips `prefer_const_constructors` on `Offset(left, top - 6)`. That is the only
  `// ignore` in the harness, and it is not in my code.
- **`flutter test`**: 7/7 pass. For every id, both skins, widths 320 / 390 / 430, height 176, static (`clock == null`) and
  live (`ValueNotifier(3.7)`) it checks:
  1. **Overflow:** the painter is drawn into a canvas with a 24 px margin and every margin pixel must still be `bg`.
     0 px found.
  2. **Labels inside the canvas:** checks the ink box of each label (Czech diacritics above the caps included).
  3. **No two labels overlap:** boxes inflated by 1 px.
  4. **No stroke under a label:** the scene is rendered without text and pixels are counted inside each label box.
     The final version has 0 warnings.
  5. **Colors:** a recording canvas checks every paint and text color. Each one must be one of the skin colors, and any
     fill wider than 8 px must have alpha ≤ 0.2. No issues found.
  6. **Copy:** all keys exist, text is uppercase, 1–3 words, no em dash.
  - Fonts: the real JetBrains Mono TTFs (Regular / Medium / SemiBold) are loaded with `FontLoader`, so the PNGs show real
    glyphs, not Ahem boxes.
- **Visual review:** contact sheets per id and skin (320 / 390 / 430 static, 390 at t = 3.7 and t = 9.1) at 2×.
  I went through about three rounds of fixes, listed below.
- **SVG fidelity:** the SVGs in `a_svg/` are not transcribed by hand. A recording `Canvas` runs **the same Dart `paint()`
  code** at width 358 with `clock == null` and writes SVG:
  - lines, rects, circles and rrects become their SVG elements;
  - paths are sampled every 0.25 px and simplified (RDP, 0.04 px tolerance);
  - text gets its baseline from Flutter's own JetBrains Mono metrics, with `text-anchor` start / middle / end for
    align 0 / 0.5 / 1.

  I rasterized the SVGs in Chromium (Playwright, JetBrains Mono embedded) and diffed them against the Flutter PNGs in
  `a_png/`. 0.1 to 1.0 % of pixels differ by more than 64/255, all of it antialiasing and glyph hinting. Side-by-side
  views are identical. The SVGs use no `id`s or `defs`, so they can be inlined many times in one HTML page.

## Design per illustration

- **dreamSignGrid**: four panels in a 2×2 grid, 1 px `line` border, 8 px corner marks in `lineStrong`.
  - Label top left, icon at 62 % of the panel width, tally marks bottom left showing how full each "pigeonhole" is
    (2 / 5+1 / 3 / 1).
  - Icons: head in profile with a four-point spark; leaping figure with a dashed arc and a ground line; square →
    wavy shape → circle with small arrows; framed landscape with a mug breaking out through the frame edge (the frame
    line is interrupted, no occluding fill).
  - The highlighted panel is **DĚJ** (action): accent border and corners, accent fill 0.06, tag "TVOJE HLAVNÍ".
  - Live: the spark breathes, a dot runs along the leap arc, the wavy shape's phase turns, the steam sways.
- **fadingTrace**:
  - Top axis "MINUTY 0–5" starting at the wake line, which is a dashed vertical labelled PROBUZENÍ. The dream wave in
    `text` runs to the left of it.
  - At the wake line the trace forks. The upper branch loses amplitude and breaks into shorter dashes, then smaller,
    fainter dots, and is gone by about 3.3 min ("ROZPLYNE SE").
  - The lower branch is caught by an accent pencil at 0.45 min and continues as a solid 2 px `accentText` line
    ("ZAPSANÝ SEN").
  - Faint stars sit in the dream area. The wave phase is anchored to the wake line, so the fork looks the same at
    every width.
  - Live: the wave drifts, the dots shimmer, a dot travels along the kept line.
- **brainMap**:
  - **Right** hemisphere in lateral view, frontal lobe to the right, so "vpravo" is anatomically consistent.
    Outline, temporal pole, cerebellum and brainstem in `muted`. Sulci (Sylvian, central, superior temporal, two
    frontal) in `lineStrong`.
  - About 25 faint seeded stars sit inside the outline (`Path.contains`). Regions are drawn as stars: dot plus thin
    cross. TPJ is an accent dot with a 0.18 halo and a thin ring.
  - Dashed orbit arcs join pre–PFC, PFC–pole, pre–TPJ and TPJ–PFC. The TPJ arcs are in accent at alpha 0.55.
  - Labels sit in the four corners with elbow leaders (vertical at x = 24 / w − 24, then horizontal into the star).
    TPJ uses two lines, "TEMPOROPARIETÁLNÍ" / "SPOJENÍ VPRAVO".
  - The brain scales with `min(h − 50, 126, 0.36·w)`, so the cerebellum stays clear of the TPJ label at 320.
  - Live: the halo pulses, the dashes flow, the stars twinkle.
- **remRebound**:
  - Two stepped hypnograms side by side (W / REM / N1 / N2 / N3, same 8 h scale), stepped line in `faint`.
  - Night 1 "KRÁTKÁ NOC" has tiny 6 px REM blocks in `muted` and ends at 5.5 h with a dashed cut. Two dashed ghost
    blocks mark the REM that never came ("CHYBÍ").
  - Night 2 "DALŠÍ NOC" has longer 14 px accent REM blocks that start earlier.
  - A thin arc arrow "DOHÁNÍ" runs from the ghost blocks to the first big REM block.
  - Caption "PRINCIP, NE MĚŘENÍ".
  - Live: a dot travels along the arc.
- **loopRoom**: a Droste room.
  - The outer frame is a bedroom in side elevation: door, window with three stars, bed with pillow and blanket, floor.
  - A mirror at (0.42, 0.07, 0.54 × 0.54) holds the same room again, and its mirror holds the third frame.
  - The third frame keeps door, window and floor, and shows an accent open palm (with a 0.12 halo) in place of the
    mirror and bed. Its corner marks are in accent.
  - Line weight and color step down with depth (`muted` → `faint`, 1 → 0.8 px).
  - Labels above each frame's left edge with short ticks: "PROBUZENÍ" / "A ZNOVU" / "TEST REALITY".
  - The room keeps aspect 1.9 (281 × 148 px) and is centred at wider widths.
  - Live: the palm halo breathes, the window stars twinkle.
- **rewriteScript**:
  - Two dog-eared sheets with text fill 0.03 and three placeholder text lines.
  - The same story wave runs on both sheets. On the left it ends in a sharp mitred spike and an end bar ("NOČNÍ MŮRA").
  - On the right it bends into a soft 2 px `accentText` arc and runs on to an end dot ("NOVÝ KONEC" / "PŘEHRÁVAT DENNĚ").
    The old spike stays there as a faint dashed ghost.
  - An accent pencil (fill 0.12) sits between the sheets.
  - Live: the pencil makes a slight writing wobble and the end dot pulses.

## Known limitations and assumptions

- **Letter spacing:** the mock assumes `skin.mono(tracking: t)` means `letterSpacing = size * t`. At 9.5 px a character
  is about 6.3 px wide. The longest labels are "TEMPOROPARIETÁLNÍ" (about 107 px) and "PŘEDNÍ ČELNÍ KŮRA" (about
  100 px).
  - If the real `AppSkin.mono` uses a different spacing or a line height, vertical centring still holds.
  - Widths change slightly. The tightest spot is the brainMap top row at 320 px, which has about 160 px of free space,
    so there is margin.
- **Brain anatomy:** the precuneus is a medial structure. It is shown projected onto the lateral profile, as the brief
  asks ("star map", not anatomy).
- **REM data:** the remRebound hypnogram values are invented to show the principle, hence the caption.
- **Night mode:** `accent == text` in red-only mode. There the highlight shows through stroke width, halo, fill and
  corner marks rather than hue. This is checked in the night PNGs.
- **Duplicated helpers:** `_corners` and `_dashed` are small private methods inside the classes that use them, because
  the deliverable is classes only (no shared top-level helpers that could collide with the other share). They could
  move into `_Art` later.
- **Per-frame work:** `brainMap` re-seeds `math.Random(11)` on every paint, so the stars are deterministic. Paints and
  paths are built per frame, the same as the sample.
- **SVG fonts:** the SVGs ask for `'JetBrains Mono', ui-monospace, monospace`. Without JetBrains Mono, text widths can
  differ a little in the preview. Positions and anchors stay the same.

## Files

- `a_classes.dart`: the six classes, no imports, paste after the existing classes.
- `a_copy.json`: `texts.training.art.<id>.<key>` for the six ids.
- `a_switch.txt`: switch arms, ids entries, height note.
- `a_svg/<id>_{day,night}.svg`: static frame, 358 × 176.
- `a_png/<id>_{day,night}.png`: 358 × 176 at 1×, plus `@2x` versions.

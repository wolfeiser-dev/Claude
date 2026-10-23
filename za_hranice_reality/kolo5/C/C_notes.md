# C) Rekonstrukce noci podle REM oken

| soubor | co to je | v appce |
|---|---|---|
| `night_reconstruction.dart` | `reconstructNight(...)`, `RecallPrompt`, `RecallKind`, `RecallGender`, pomocníci na texty a seznam klíčů `reconstructionTextKeys`. Čistý Dart 3.6 bez importů z SDK. | zůstává, uprav dva importy |
| `dream_types.dart` | kopie `Dream` a jeho výčtů ze zadání B | **smazat**, importovat model appky |
| `rem_window_types.dart` | kopie `RemLevel` a `RemWindow` z `kolo4/B/rem_types.dart` | **smazat**, importovat soubor appky s `RemWindow` (podle kola 4 `rem_probability.dart`) |
| `night_reconstruction_test.dart` | 18 testů (package:test) | importy `package:recon_pkg/...` přepiš na appku. Texty hledá v `RECON_DATA`, jinak v `./` a `../`. |
| `rekonstrukce_texty.json` | 48 textů `reconstruction.*`, vlož je hlubokým sloučením | nové, nic nepřepisují |
| `rekonstrukce_ui.md` | 7 zásad UI | |

## Rozhodnutí

- **Okna → epizody.** Model z kola 4 rozdělí jednu REM periodu na úseky stejné úrovně (`mid`, `high`, `mid`). Okna, která se dotýkají nebo je dělí nejvýš 10 minut, proto spojuju do jedné epizody, jinak by se průvodce na jednu periodu ptal třikrát. Úroveň epizody je nejvyšší úroveň jejích oken.
- **Čas otázky je střed epizody oříznuté na probuzení**, zaokrouhlený na 10 minut na ciferníku (polovina nahoru). Kdyby zaokrouhlení padlo za probuzení, beru násobek pod ním. Proč střed:
  - obě hrany okna jsou stejně nejisté, takže střed má nejmenší nejhorší chybu,
  - u periody `mid`, `high`, `mid` padne do jádra `high`,
  - konec poslední epizody by splynul s probuzením, a na to už odpověděl ranní zápis.
- **Zapsaný sen:**
  - sen s `dreamAt` uvnitř epizody dá variantu „navázal na něj ještě jiný?“,
  - `wokeFromDream` se přiřadí i do 15 minut po konci epizody, protože zařízení značí probuzení posunutě,
  - sny bez času a prázdná noc se nepřiřazují.
- **Duplicity.** Epizody se stejným zaokrouhleným okamžikem slučuju. Porovnávám okamžik, ne ciferník: při přechodu na zimní čas zůstanou dvě otázky „Kolem 2:30“, protože jde o dvě různé chvíle hodinu po sobě. Mezi oddělenými epizodami se to stane jen u probuzení.
- **Letní čas a půlnoc.** Délky a středy počítám na okamžicích, ciferník čtu až při zaokrouhlení. Okno 1:40 až 3:20 v noci na 29. 3. trvá 40 minut a jeho střed je 3:00, ne neexistující 2:30.
- **Texty:**
  - Výchozí znění je neutrální („Kolem 5:20 se ti nejspíš něco zdálo. Co to bylo?“). Mužský a ženský tvar je volitelný přes `gender`, stejně i u doplňujících otázek („Kde jsi byl/byla?“).
  - U oken `low` je opatrnější znění „možná“.
  - Místo „K 5:20“ píšu „Kolem 5:20“. Předložka by se měnila podle čísla (ke 2:10, ke 3:20) a „kolem“ zní jako odhad.
  - Noční varianty mají nejvýš 6 slov.

## Ověření

Dart 3.6.2, balíček `scratchpad/recon_pkg`:
- `dart analyze`: 0 problémů (lints recommended a `curly_braces_in_flow_control_structures`),
- `brace_fix.py --check`: 0 u všech čtyř souborů,
- `dart test`: 18/18 v pásmech `UTC`, `Europe/Prague`, `America/Sao_Paulo`, `Asia/Kathmandu` (+5:45) a `Australia/Lord_Howe` (posun o 30 minut).

Testy kontrolují:
- pořadí a čísla oken, spojení `mid`, `high`, `mid` a hranici mezery 10 minut,
- vynechání `unlikely` a `low` jen jako nouzi,
- zaokrouhlení včetně poloviny a okamžiku probuzení,
- okna po probuzení a oříznutí okna přes probuzení,
- duplicity u probuzení a překryvná okna,
- zapsaný sen v okně, probuzení ze snu, víc snů, sny bez času a prázdnou noc,
- `max`, půlnoc, oba přechody letního času a prázdné nebo vadné vstupy,
- rod oslovení a determinismus (50 zamíchání, neměnné vstupy),
- 400 náhodných nocí s invarianty,
- texty:
  - klíče přesně podle kódu,
  - zástupné symboly,
  - bez dlouhé pomlčky, bez procent a bez vykání,
  - noční texty nejvýš 6 slov, upozornění nejvýš 60 znaků, štítky velkými písmeny.

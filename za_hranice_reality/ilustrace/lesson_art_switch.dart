// 1) Do `switch (id)` v TrainingArt.build vlož před výchozí větev `_ => _Ladder(skin, l, clock),`:
      'dreamSignGrid' => _DreamSignGrid(skin, l, clock),
      'fadingTrace' => _FadingTrace(skin, l, clock),
      'brainMap' => _BrainMap(skin, l, clock),
      'remRebound' => _RemRebound(skin, l, clock),
      'loopRoom' => _LoopRoom(skin, l, clock),
      'rewriteScript' => _RewriteScript(skin, l, clock),
      'seedMoon' => _SeedMoon(skin, l, clock),
      'cueWave' => _CueWave(skin, l, clock),
      'timeline' => _Timeline(skin, l, clock),
      'eyeSignal' => _EyeSignal(skin, l, clock),
      'chronoDial' => _ChronoDial(skin, l, clock),
      'twoHypnograms' => _TwoHypnograms(skin, l, clock),

// 2) Do `static const ids = [...]` přidej:
    'dreamSignGrid',
    'fadingTrace',
    'brainMap',
    'remRebound',
    'loopRoom',
    'rewriteScript',
    'seedMoon',
    'cueWave',
    'timeline',
    'eyeSignal',
    'chronoDial',
    'twoHypnograms',

// 3) Výška: všech 12 ilustrací používá výchozích 176 px (ověřeno na šířkách 320, 358, 390 a 430).
//    Řádek `height: height ?? (id == 'realityTree' ? 210 : 176)` zůstává beze změny.

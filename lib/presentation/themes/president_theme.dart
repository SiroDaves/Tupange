import '../../core/utils/constants/app_assets.dart';
import '../widgets/layout/puzzle_layout.dart';
import '../widgets/layout/puzzle_layout_delegate.dart';
import 'puzzle_theme.dart';

abstract class PresidentTheme extends PuzzleTheme {
  const PresidentTheme();

  @override
  String get name => 'President';

  @override
  PuzzleLayout get puzzleLayoutDelegate => PuzzleLayoutDelegate();
}

class President1Theme extends PresidentTheme {
  const President1Theme();

  @override
  String get assetForTile => AppAssets.president1Image;
}

class President2Theme extends PresidentTheme {
  const President2Theme();

  @override
  String get assetForTile => AppAssets.president2Image;
}

class President3Theme extends PresidentTheme {
  const President3Theme();

  @override
  String get assetForTile => AppAssets.president3Image;
}

class President4Theme extends PresidentTheme {
  const President4Theme();

  @override
  String get assetForTile => AppAssets.president4Image;
}

class President5Theme extends PresidentTheme {
  const President5Theme();

  @override
  String get assetForTile => AppAssets.president5Image;
}

class President6Theme extends PresidentTheme {
  const President6Theme();

  @override
  String get assetForTile => AppAssets.president6Image;
}

class President7Theme extends PresidentTheme {
  const President7Theme();

  @override
  String get assetForTile => AppAssets.president7Image;
}

class President8Theme extends PresidentTheme {
  const President8Theme();

  @override
  String get assetForTile => AppAssets.president8Image;
}

class President9Theme extends PresidentTheme {
  const President9Theme();

  @override
  String get assetForTile => AppAssets.president9Image;
}

class President10Theme extends PresidentTheme {
  const President10Theme();

  @override
  String get assetForTile => AppAssets.president10Image;
}

class President11Theme extends PresidentTheme {
  const President11Theme();

  @override
  String get assetForTile => AppAssets.president11Image;
}

class President12Theme extends PresidentTheme {
  const President12Theme();

  @override
  String get assetForTile => AppAssets.president12Image;
}

class President13Theme extends PresidentTheme {
  const President13Theme();

  @override
  String get assetForTile => AppAssets.president13Image;
}

class President14Theme extends PresidentTheme {
  const President14Theme();

  @override
  String get assetForTile => AppAssets.president14Image;
}

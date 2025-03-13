import '../../core/utils/constants/app_assets.dart';
import '../widgets/layout/puzzle_layout.dart';
import '../widgets/layout/puzzle_layout_delegate.dart';
import 'puzzle_theme.dart';

abstract class AnimalTheme extends PuzzleTheme {
  const AnimalTheme();

  @override
  String get name => 'Animal';

  @override
  PuzzleLayout get puzzleLayoutDelegate => PuzzleLayoutDelegate();
}

class Animal1Theme extends AnimalTheme {
  const Animal1Theme();

  @override
  String get assetForTile => AppAssets.animal1Image;
}

class Animal2Theme extends AnimalTheme {
  const Animal2Theme();

  @override
  String get assetForTile => AppAssets.animal2Image;
}

class Animal3Theme extends AnimalTheme {
  const Animal3Theme();

  @override
  String get assetForTile => AppAssets.animal3Image;
}

class Animal4Theme extends AnimalTheme {
  const Animal4Theme();

  @override
  String get assetForTile => AppAssets.animal4Image;
}

class Animal5Theme extends AnimalTheme {
  const Animal5Theme();

  @override
  String get assetForTile => AppAssets.animal5Image;
}

class Animal6Theme extends AnimalTheme {
  const Animal6Theme();

  @override
  String get assetForTile => AppAssets.animal6Image;
}

class Animal7Theme extends AnimalTheme {
  const Animal7Theme();

  @override
  String get assetForTile => AppAssets.animal7Image;
}

class Animal8Theme extends AnimalTheme {
  const Animal8Theme();

  @override
  String get assetForTile => AppAssets.animal8Image;
}

class Animal9Theme extends AnimalTheme {
  const Animal9Theme();

  @override
  String get assetForTile => AppAssets.animal9Image;
}

class Animal10Theme extends AnimalTheme {
  const Animal10Theme();

  @override
  String get assetForTile => AppAssets.animal10Image;
}

class Animal11Theme extends AnimalTheme {
  const Animal11Theme();

  @override
  String get assetForTile => AppAssets.animal11Image;
}

class Animal12Theme extends AnimalTheme {
  const Animal12Theme();

  @override
  String get assetForTile => AppAssets.animal12Image;
}

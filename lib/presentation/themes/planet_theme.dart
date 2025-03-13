import '../../core/utils/constants/app_assets.dart';
import '../widgets/layout/puzzle_layout.dart';
import '../widgets/layout/puzzle_layout_delegate.dart';
import 'puzzle_theme.dart';

abstract class PlanetTheme extends PuzzleTheme {
  const PlanetTheme();

  @override
  String get name => 'Planet';

  @override
  PuzzleLayout get puzzleLayoutDelegate => PuzzleLayoutDelegate();
}

class Planet1Theme extends PlanetTheme {
  const Planet1Theme();

  @override
  String get assetForTile => AppAssets.planet1Image;
}

class Planet2Theme extends PlanetTheme {
  const Planet2Theme();

  @override
  String get assetForTile => AppAssets.planet2Image;
}

class Planet3Theme extends PlanetTheme {
  const Planet3Theme();

  @override
  String get assetForTile => AppAssets.planet3Image;
}

class Planet4Theme extends PlanetTheme {
  const Planet4Theme();

  @override
  String get assetForTile => AppAssets.planet4Image;
}

class Planet5Theme extends PlanetTheme {
  const Planet5Theme();

  @override
  String get assetForTile => AppAssets.planet5Image;
}

class Planet6Theme extends PlanetTheme {
  const Planet6Theme();

  @override
  String get assetForTile => AppAssets.planet6Image;
}

class Planet7Theme extends PlanetTheme {
  const Planet7Theme();

  @override
  String get assetForTile => AppAssets.planet7Image;
}

class Planet8Theme extends PlanetTheme {
  const Planet8Theme();

  @override
  String get assetForTile => AppAssets.planet8Image;
}

class Planet9Theme extends PlanetTheme {
  const Planet9Theme();

  @override
  String get assetForTile => AppAssets.planet9Image;
}
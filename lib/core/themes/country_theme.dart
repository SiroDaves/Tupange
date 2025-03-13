import '../../common/utils/constants/app_assets.dart';
import '../../presentation/widgets/layout/puzzle_layout.dart';
import '../../presentation/widgets/layout/puzzle_layout_delegate.dart';
import 'puzzle_theme.dart';

abstract class CountryTheme extends PuzzleTheme {
  const CountryTheme();

  @override
  String get name => 'Country';

  @override
  PuzzleLayout get puzzleLayoutDelegate => PuzzleLayoutDelegate();
}

class Country1Theme extends CountryTheme {
  const Country1Theme();

  @override
  String get assetForTile => AppAssets.country1Image;
}

class Country2Theme extends CountryTheme {
  const Country2Theme();

  @override
  String get assetForTile => AppAssets.country2Image;
}

class Country3Theme extends CountryTheme {
  const Country3Theme();

  @override
  String get assetForTile => AppAssets.country3Image;
}

class Country4Theme extends CountryTheme {
  const Country4Theme();

  @override
  String get assetForTile => AppAssets.country4Image;
}

class Country5Theme extends CountryTheme {
  const Country5Theme();

  @override
  String get assetForTile => AppAssets.country5Image;
}

class Country6Theme extends CountryTheme {
  const Country6Theme();

  @override
  String get assetForTile => AppAssets.country6Image;
}

class Country7Theme extends CountryTheme {
  const Country7Theme();

  @override
  String get assetForTile => AppAssets.country7Image;
}

class Country8Theme extends CountryTheme {
  const Country8Theme();

  @override
  String get assetForTile => AppAssets.country8Image;
}

class Country9Theme extends CountryTheme {
  const Country9Theme();

  @override
  String get assetForTile => AppAssets.country9Image;
}

class Country10Theme extends CountryTheme {
  const Country10Theme();

  @override
  String get assetForTile => AppAssets.country10Image;
}

class Country11Theme extends CountryTheme {
  const Country11Theme();

  @override
  String get assetForTile => AppAssets.country11Image;
}

class Country12Theme extends CountryTheme {
  const Country12Theme();

  @override
  String get assetForTile => AppAssets.country12Image;
}

class Country13Theme extends CountryTheme {
  const Country13Theme();

  @override
  String get assetForTile => AppAssets.country13Image;
}

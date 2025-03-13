import '../../core/utils/constants/app_assets.dart';
import '../widgets/layout/puzzle_layout.dart';
import '../widgets/layout/puzzle_layout_delegate.dart';
import 'puzzle_theme.dart';

abstract class VehicleTheme extends PuzzleTheme {
  const VehicleTheme();

  @override
  String get name => 'Vehicle';

  @override
  PuzzleLayout get puzzleLayoutDelegate => PuzzleLayoutDelegate();
}

class Vehicle1Theme extends VehicleTheme {
  const Vehicle1Theme();

  @override
  String get assetForTile => AppAssets.vehicle1Image;
}

class Vehicle2Theme extends VehicleTheme {
  const Vehicle2Theme();

  @override
  String get assetForTile => AppAssets.vehicle2Image;
}

class Vehicle3Theme extends VehicleTheme {
  const Vehicle3Theme();

  @override
  String get assetForTile => AppAssets.vehicle3Image;
}

class Vehicle4Theme extends VehicleTheme {
  const Vehicle4Theme();

  @override
  String get assetForTile => AppAssets.vehicle4Image;
}

class Vehicle5Theme extends VehicleTheme {
  const Vehicle5Theme();

  @override
  String get assetForTile => AppAssets.vehicle5Image;
}

class Vehicle6Theme extends VehicleTheme {
  const Vehicle6Theme();

  @override
  String get assetForTile => AppAssets.vehicle6Image;
}

class Vehicle7Theme extends VehicleTheme {
  const Vehicle7Theme();

  @override
  String get assetForTile => AppAssets.vehicle7Image;
}

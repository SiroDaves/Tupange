import '../../../core/utils/constants/app_assets.dart';
import 'game_puzzle_theme.dart';

class PuzzleThemeOne extends GamePuzzleTheme {
  const PuzzleThemeOne();

  @override
  String get backgroundAsset => AppAssets.earthLandscape;

  @override
  String get assetForTile => AppAssets.earthAnimation;

  @override
  String get placeholderAssetForTile => AppAssets.earthImage;

  @override
  String get placeholderThumbnail => AppAssets.earthThumb;
}

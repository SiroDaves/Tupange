import '../../../core/layout/delegates/puzzle_layout_delegate.dart';

abstract class PuzzleTheme {
  const PuzzleTheme();

  String get name;

  String get backgroundAsset;

  PuzzleLayoutDelegate get puzzleLayoutDelegate;

  String get assetForTile;

  String get placeholderAssetForTile;

  String get placeholderThumbnail;
}

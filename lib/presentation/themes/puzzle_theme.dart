import '../widgets/layout/puzzle_layout.dart';

abstract class PuzzleTheme {
  const PuzzleTheme();

  String get name;

  String get assetForTile;

  PuzzleLayout get puzzleLayoutDelegate;
}

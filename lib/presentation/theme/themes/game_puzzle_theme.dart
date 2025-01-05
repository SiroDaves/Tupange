import '../../../core/layout/layout.dart';
import '../../screens/puzzles/game_layout_delegate.dart';
import 'puzzle_theme.dart';

abstract class GamePuzzleTheme extends PuzzleTheme {
  const GamePuzzleTheme();

  @override
  String get name => 'Game';

  @override
  PuzzleLayoutDelegate get puzzleLayoutDelegate => GameLayoutDelegate();
}

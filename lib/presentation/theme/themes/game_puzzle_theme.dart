import '../../../core/layout/delegates/puzzle_layout_delegate.dart';
import '../../../core/layout/delegates/game_layout_delegate.dart';
import 'puzzle_theme.dart';

abstract class GamePuzzleTheme extends PuzzleTheme {
  const GamePuzzleTheme();

  @override
  String get name => 'Game';

  @override
  PuzzleLayoutDelegate get puzzleLayoutDelegate => GameLayoutDelegate();
}

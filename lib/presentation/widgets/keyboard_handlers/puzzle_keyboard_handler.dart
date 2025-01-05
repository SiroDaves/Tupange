import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/tile.dart';
import '../../blocs/puzzle/puzzle_bloc.dart';
import '../../blocs/game/game_puzzle_bloc.dart';
import '../../blocs/timer/timer_bloc.dart';
import '../../cubits/puzzle_helper/puzzle_helper_cubit.dart';
import '../../cubits/puzzle_init/puzzle_init_cubit.dart';

class PuzzleKeyboardHandler extends StatefulWidget {
  final Widget child;

  const PuzzleKeyboardHandler({
    super.key,
    required this.child,
  });

  @override
  PuzzleKeyboardHandlerState createState() => PuzzleKeyboardHandlerState();
}

class PuzzleKeyboardHandlerState extends State<PuzzleKeyboardHandler> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onStart(bool hasStarted) {
    context.read<TimerBloc>().add(const TimerReset());
    context.read<GamePuzzleBloc>().add(PlanetCountdownReset(
          secondsToBegin: hasStarted ? 5 : 3,
        ));
  }

  void _onAutoSolve(PuzzleAutoSolveState autoSolveState) {
    if (autoSolveState == PuzzleAutoSolveState.start) {
      context.read<PuzzleHelperCubit>().startAutoSolver();
    } else {
      context.read<PuzzleHelperCubit>().stopAutoSolver();
    }
  }

  void _onRestart() {
    _onStart(true);
    context
        .read<PuzzleBloc>()
        .add(const PuzzleInitialized(shufflePuzzle: false));
  }

  /// For the puzzle, the following keyboard events are important
  /// [Space] Start / Auto Solve / Stop
  /// [R] key -> restart
  /// [V] key -> toggle visibility of helpers (numbers)
  /// [UpArrow] key -> move whitespace up
  /// [DownArrow] key -> move whitespace down
  /// [LeftArrow] key -> move whitespace left
  /// [RightArrow] key -> move whitespace right
  /// [esc] key -> move back to solar system
  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final physicalKey = event.data.physicalKey;

      final puzzleInitState = context.read<PuzzleInitCubit>().state;
      final planetPuzzleState = context.read<GamePuzzleBloc>().state;

      final isAutoSolving =
          context.read<PuzzleHelperCubit>().state.isAutoSolving;

      final isReady = puzzleInitState is PuzzleInitReady;
      final hasStarted = planetPuzzleState.status == GamePuzzleStatus.started;
      final isLoading = planetPuzzleState.status == GamePuzzleStatus.loading;

      final puzzleBloc = context.read<PuzzleBloc>();

      final puzzle = puzzleBloc.state.puzzle;
      final puzzleIncomplete =
          puzzleBloc.state.puzzleStatus == PuzzleStatus.incomplete;

      final canPress = hasStarted && puzzleIncomplete && !isAutoSolving;

      Tile? tile;

      if (physicalKey == PhysicalKeyboardKey.space) {
        /// do not do anything if
        /// 1. puzzle is not ready
        /// 2. puzzle is loading
        if (!isReady || isLoading) return;

        if (hasStarted && puzzleIncomplete) {
          _onAutoSolve(
            isAutoSolving
                ? PuzzleAutoSolveState.stop
                : PuzzleAutoSolveState.start,
          );
        } else {
          _onStart(hasStarted);
        }
      } else if (physicalKey == PhysicalKeyboardKey.keyR) {
        if (!hasStarted || isAutoSolving) return;
        _onRestart();
      } else if (physicalKey == PhysicalKeyboardKey.keyV) {
        context.read<PuzzleHelperCubit>().onHelpToggle();
      } else if (physicalKey == PhysicalKeyboardKey.arrowUp) {
        tile = puzzle.getTileRelativeToWhitespaceTile(const Offset(0, -1));
      } else if (physicalKey == PhysicalKeyboardKey.arrowDown) {
        tile = puzzle.getTileRelativeToWhitespaceTile(const Offset(0, 1));
      } else if (physicalKey == PhysicalKeyboardKey.arrowRight) {
        tile = puzzle.getTileRelativeToWhitespaceTile(const Offset(1, 0));
      } else if (physicalKey == PhysicalKeyboardKey.arrowLeft) {
        tile = puzzle.getTileRelativeToWhitespaceTile(const Offset(-1, 0));
      } else if (physicalKey == PhysicalKeyboardKey.escape) {
        Navigator.pop(context);
      }

      if (tile != null && canPress) {
        context.read<PuzzleBloc>().add(TileTapped(tile));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: Builder(builder: (context) {
        if (!_focusNode.hasFocus) {
          FocusScope.of(context).requestFocus(_focusNode);
        }
        return widget.child;
      }),
    );
  }
}

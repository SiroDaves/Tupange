import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/timer/timer_bloc.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../data/models/tile.dart';
import '../../../blocs/puzzle/puzzle_bloc.dart';
import '../../../theme/bloc/theme_bloc.dart';
import '../../../widgets/keyboard_handlers/puzzle_keyboard_handler.dart';

class PuzzleBoard extends StatelessWidget {
  const PuzzleBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final puzzle = context.select((PuzzleBloc bloc) => bloc.state.puzzle);

    final size = puzzle.getDimension();
    if (size == 0) return const Center(child: CircularProgressIndicator());

    return PuzzleKeyboardHandler(
      child: BlocListener<PuzzleBloc, PuzzleState>(
        listener: (context, state) {
          if (state.puzzleStatus == PuzzleStatus.complete) {
            AppUtils.logger('PuzzleBoard: PuzzleStatus.complete');
            context.read<TimerBloc>().add(const TimerStopped());
          }
        },
        child: theme.puzzleLayoutDelegate.boardBuilder(
          size,
          puzzle.tiles
              .map((tile) => _PuzzleTile(
                    key: Key('puzzle_tile_${tile.value}'),
                    tile: tile,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _PuzzleTile extends StatelessWidget {
  const _PuzzleTile({super.key, required this.tile});

  /// The tile to be displayed.
  final Tile tile;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return tile.isWhitespace
        ? theme.puzzleLayoutDelegate.whitespaceTileBuilder(tile)
        : theme.puzzleLayoutDelegate.tileBuilder(tile);
  }
}

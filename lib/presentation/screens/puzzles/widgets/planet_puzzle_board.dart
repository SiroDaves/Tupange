import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/timer/timer_bloc.dart';
import '../../../cubits/audio/audio_player_cubit.dart';
import '../../../../core/helpers/modal_helpers.dart';
import '../../../../core/layout/layout.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../blocs/puzzle/puzzle_bloc.dart';
import '../../../blocs/puzzles/planet_puzzle_bloc.dart';
import '../../../cubits/level_selection/level_selection_cubit.dart';
import '../../../cubits/puzzle_selection/puzzle_selection_cubit.dart';
import '../../../cubits/puzzle/helper/puzzle_helper_cubit.dart';
import '../layout/planet_puzzle_layout_delegate.dart';
import 'planet_puzzle_completion_dialog.dart';

class PlanetPuzzleBoard extends StatefulWidget {
  final List<Widget> tiles;

  const PlanetPuzzleBoard({super.key, required this.tiles});

  @override
  State<PlanetPuzzleBoard> createState() => _PlanetPuzzleBoardState();
}

class _PlanetPuzzleBoardState extends State<PlanetPuzzleBoard> {
  Timer? _completePuzzleTimer;

  void _onPuzzleCompletionDialog(BuildContext context) async {
    AppUtils.logger('PlanetPuzzleBoard: _onPuzzleCompletionDialog');

    // play completion audio
    context.read<AudioPlayerCubit>().completion();

    Timer(AppConstants.kMS300, () {
      // after dialog finishes, reset the puzzle to initial state
      context.read<PlanetPuzzleBloc>().add(const PlanetPuzzleResetEvent());
    });

    // show dialog
    showAppDialog(
      context: context,

      /// for medium and large screen, same size
      sameSize: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<LevelSelectionCubit>()),
          BlocProvider.value(value: context.read<PuzzleSelectionCubit>()),
          BlocProvider.value(value: context.read<PuzzleHelperCubit>()),
          BlocProvider.value(value: context.read<TimerBloc>()),
          BlocProvider.value(value: context.read<PuzzleBloc>()),
        ],
        child: PlanetPuzzleCompletionDialog(),
      ),
    );
  }

  @override
  void dispose() {
    _completePuzzleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PuzzleBloc, PuzzleState>(
      listener: (BuildContext context, PuzzleState state) {
        if (state.puzzleStatus == PuzzleStatus.complete) {
          _completePuzzleTimer = Timer(AppConstants.kMS500, () {
            _onPuzzleCompletionDialog(context);
          });
        }
      },
      child: ResponsiveLayoutBuilder(
        small: (_, Widget? child) => _PuzzleBoard(
          size: BoardSize.small,
          child: child,
        ),
        medium: (_, Widget? child) => _PuzzleBoard(
          size: BoardSize.medium,
          child: child,
        ),
        large: (_, Widget? child) => _PuzzleBoard(
          size: BoardSize.large,
          child: child,
        ),
        child: (_) => Stack(children: widget.tiles),
      ),
    );
  }
}

class _PuzzleBoard extends StatelessWidget {
  final double size;
  final Widget? child;

  const _PuzzleBoard({
    this.child,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: size, child: child);
  }
}

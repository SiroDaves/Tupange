import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tupange/core/l10n/l10n.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../blocs/timer/timer_bloc.dart';
import '../../../blocs/puzzle/puzzle_bloc.dart';
import '../../../blocs/puzzles/planet_puzzle_bloc.dart';
import '../../../cubits/audio/audio_player_cubit.dart';
import '../../../widgets/animated_text.dart';
import '../../../widgets/stylized_text.dart';

class PlanetPuzzleStats extends StatelessWidget {
  const PlanetPuzzleStats({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((PuzzleBloc bloc) => bloc.state);

    return BlocListener<PlanetPuzzleBloc, PlanetPuzzleState>(
      listener: (context, state) {
        if (!state.isCountdownRunning) {
          return;
        }

        // play shuffling sound
        if (state.secondsToBegin == 3) {
          context.read<AudioPlayerCubit>().beginCountDown();
        }

        if (state.status == PlanetPuzzleStatus.started) {
          context.read<TimerBloc>().add(const TimerStarted());
        }

        // on every tick, we shuffle the puzzle
        if (state.secondsToBegin >= 1 && state.secondsToBegin <= 3) {
          context.read<PuzzleBloc>().add(const PuzzleReset());
        }
      },
      child: ResponsiveLayoutBuilder(
        small: (_, Widget? child) => child!,
        medium: (_, Widget? child) => child!,
        large: (_, Widget? child) => child!,
        child: (layoutSize) {
          return _PuzzleStats(layoutSize: layoutSize, puzzleState: state);
        },
      ),
    );
  }
}

class _PuzzleStats extends StatelessWidget {
  final ResponsiveLayoutSize layoutSize;
  final PuzzleState puzzleState;

  const _PuzzleStats({
    Key? key,
    required this.layoutSize,
    required this.puzzleState,
  }) : super(key: key);

  String _getDurationLabel(Duration duration, BuildContext context) {
    final hours = duration.inHours.toString();
    final minutes = duration.inMinutes.remainder(60).toString();
    final seconds = duration.inSeconds.remainder(60).toString();
    return context.l10n.puzzleDurationLabelText(hours, minutes, seconds);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((PlanetPuzzleBloc bloc) => bloc.state);
    final secondsElapsed = context.select(
      (TimerBloc bloc) => bloc.state.secondsElapsed,
    );

    final isLarge = layoutSize == ResponsiveLayoutSize.large;

    String textToShow = '';
    bool isTicking = false;

    if (!state.isCountdownRunning || state.secondsToBegin > 3) {
      // show: '00:00:00 | 0 Moves',
      final timeText = AppUtils.getFormattedElapsedSeconds(secondsElapsed);
      textToShow = context.l10n.puzzleStats(
        timeText,
        puzzleState.numberOfMoves,
      );
    } else {
      // show: ticking 3..2..1..Go!
      isTicking = true;
      if (state.secondsToBegin > 0) {
        textToShow = '${state.secondsToBegin}';
      } else {
        textToShow = context.l10n.go;
      }
    }

    if (state.status == PlanetPuzzleStatus.notStarted) {
      textToShow = context.l10n.notStarted;
    }

    final child = StylizedText(
      text: textToShow,
      textColor: Colors.white,
      fontSize: isLarge ? 32.0 : 28.0,
      semanticsLabel: _getDurationLabel(
        Duration(seconds: secondsElapsed),
        context,
      ),
    );

    if (isTicking) {
      return AppAnimatedWidget(
        key: ValueKey(state.secondsToBegin),
        child: child,
      );
    } else {
      return Semantics(
        label: 'Moves: ${puzzleState.numberOfMoves}',
        child: ExcludeSemantics(child: child),
      );
    }
  }
}

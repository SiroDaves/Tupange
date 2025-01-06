import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/audio/audio_player_cubit.dart';
import '../../blocs/timer/timer_bloc.dart';
import '../../../core/utils/app_utils.dart';
import '../../../data/models/puzzle.dart';
import '../../../data/models/ticker.dart';
import '../../blocs/puzzle/puzzle_bloc.dart';
import '../../blocs/puzzles/planet_puzzle_bloc.dart';
import '../../cubits/level_selection/level_selection_cubit.dart';
import '../../cubits/game_selection/game_selection_cubit.dart';
import '../../cubits/puzzle_helper/puzzle_helper_cubit.dart';
import '../../cubits/puzzle_init/puzzle_init_cubit.dart';
import '../../cubits/puzzle_fact/planet_fact_cubit.dart';
import '../../theme/bloc/theme_bloc.dart';
import '../../widgets/background/background.dart';
import 'widgets/puzzle_header.dart';
import 'widgets/puzzle_sections.dart';

class PuzzlePage extends StatelessWidget {
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlanetPuzzleBloc(
            secondsToBegin: context.read<LevelSelectionCubit>().puzzleSize,
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (context) => PuzzleInitCubit(
            context.read<LevelSelectionCubit>().puzzleSize,
            context.read<PlanetPuzzleBloc>(),
          ),
        ),
        BlocProvider(
          create: (context) => PuzzleBloc(
            context.read<LevelSelectionCubit>().puzzleSize,
            context.read<AudioPlayerCubit>(),
          )..add(const PuzzleInitialized(shufflePuzzle: false)),
        ),
        BlocProvider(
          create: (context) => PuzzleHelperCubit(
            context.read<PuzzleBloc>(),
            context.read<AudioPlayerCubit>(),
            optimized: AppUtils.isOptimizedPuzzle() ||
                context.read<LevelSelectionCubit>().puzzleLevel ==
                    PuzzleLevel.hard,
          ),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(
            planet: context.read<PuzzleSelectionCubit>().planet,
          ),
        ),
        BlocProvider(
          create: (_) => TimerBloc(
            ticker: const Ticker(),
          ),
        ),
        BlocProvider(
          create: (_) => PlanetFactCubit(
            planetType: context.read<PuzzleSelectionCubit>().planet.type,
            context: context,
          ),
        ),
      ],
      child: const _PuzzleView(),
    );
  }
}

class _PuzzleView extends StatelessWidget {
  const _PuzzleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    // final state = context.select((PuzzleBloc bloc) => bloc.state);

    return Background(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // background
              BlocBuilder<PuzzleBloc, PuzzleState>(
                bloc: context.read<PuzzleBloc>(),
                builder: (_, puzzleState) {
                  return theme.puzzleLayoutDelegate.backgroundBuilder(
                    theme,
                    puzzleState,
                  );
                },
              ),

              // main body
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PuzzleHeader(),
                      PuzzleSections(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

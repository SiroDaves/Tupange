import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tupange/core/l10n/l10n.dart';

import '../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/puzzle_utils.dart';
import '../../blocs/timer/timer_bloc.dart';
import '../../blocs/puzzle/puzzle_bloc.dart';
import '../../cubits/game_selection/game_selection_cubit.dart';
import '../../cubits/level_selection/level_selection_cubit.dart';
import '../../cubits/puzzle_helper/puzzle_helper_cubit.dart';
import '../general/stylized_text.dart';
import 'puzzle_completion_dialog_large.dart';
import 'share_buttons.dart';

class PuzzleCompletionDialog extends StatelessWidget {
  PuzzleCompletionDialog({super.key});

  final globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            width: 2.0,
            color: Colors.amber,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ResponsiveLayoutBuilder(
            small: (_, __) => PuzzleCompletionDialogSmall(
              key: const Key('PuzzleCompletionDialogSmall'),
              globalKey: globalKey,
            ),
            medium: (_, Widget? child) => child!,
            large: (_, Widget? child) => child!,
            child: (_) => PuzzleCompletionDialogLarge(
              key: const Key('PuzzleCompletionDialogLarge'),
              globalKey: globalKey,
            ),
          ),
        ),
      ),
    );
  }
}

class PuzzleCompletionDialogSmall extends StatelessWidget {
  final GlobalKey globalKey;

  const PuzzleCompletionDialogSmall({
    super.key,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) {
    final secondsElapsed = context.read<TimerBloc>().state.secondsElapsed;
    final totalMoves = context.read<PuzzleBloc>().state.numberOfMoves;
    final game = context.read<GameSelectionCubit>().game;
    final autoSolverSteps = context.read<PuzzleHelperCubit>().autoSolverSteps;
    final level = context.read<LevelSelectionCubit>().puzzleSize;
    final isAutoSolverUsed = autoSolverSteps != 0;

    final xOffset = -MediaQuery.of(context).size.width * 0.50;

    return Stack(
      alignment: Alignment.center,
      children: [
        // game image
        Transform.translate(
          offset: Offset(xOffset, 0.0),
          child: Transform.scale(
            scale: 1.5,
            child: PuzzleUtils.getImagePath(game.image!),
          ),
        ),

        Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.60),
          ),
        ),

        // main body
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // heading
              FittedBox(
                fit: BoxFit.fitWidth,
                child: StylizedText(
                  text: context.l10n.congrats,
                  strokeWidth: 4.0,
                  offset: 1.0,
                ),
              ),

              Text(
                context.l10n.congratsSubTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  letterSpacing: 2.0,
                ),
              ),

              const Gap(32.0),

              Text(
                context.l10n.successMessage(
                  game.title!,
                  AppUtils.getSuccessExtraText(
                    totalSteps: totalMoves,
                    autoSolverSteps: autoSolverSteps,
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 1.5,
                  wordSpacing: 1.5,
                ),
              ),

              const Gap(38.0),

              // star
              WinStarWidget(
                star: AppUtils.getScore(
                  secondsTaken: secondsElapsed,
                  totalSteps: totalMoves,
                  autoSolverSteps: autoSolverSteps,
                  puzzleSize: level,
                ),
              ),

              const Gap(38.0),

              StylizedText(
                textAlign: TextAlign.center,
                text: context.l10n.scoreBoard,
                fontSize: 24.0,
                strokeWidth: 5.0,
                offset: 2.0,
              ),

              const Gap(16.0),

              ScoreTile(
                icon: FontAwesomeIcons.hashtag,
                text: context.l10n.totalMoves(totalMoves),
              ),

              const Gap(8.0),

              ScoreTile(
                icon: FontAwesomeIcons.stopwatch,
                text: AppUtils.getFormattedElapsedSeconds(secondsElapsed),
              ),

              const Gap(8.0),

              ScoreTile(
                icon: FontAwesomeIcons.laptopCode,
                text: isAutoSolverUsed
                    ? context.l10n.usedAutosolve
                    : context.l10n.noAutosolve,
              ),

              const Gap(38.0),

              StylizedText(
                text: context.l10n.share,
                fontSize: 24.0,
              ),

              const Gap(32),

              // buttons
              ShareButtons(game: game, globalKey: globalKey),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tupange/core/l10n/l10n.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/puzzle_utils.dart';
import '../../blocs/timer/timer_bloc.dart';
import '../../blocs/puzzle/puzzle_bloc.dart';
import '../../cubits/game_selection/game_selection_cubit.dart';
import '../../cubits/level_selection/level_selection_cubit.dart';
import '../../cubits/puzzle_helper/puzzle_helper_cubit.dart';
import '../stylized_text.dart';
import 'share_buttons.dart';

class PuzzleCompletionDialogLarge extends StatelessWidget {
  final GlobalKey globalKey;

  const PuzzleCompletionDialogLarge({
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

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: PuzzleUtils.getImagePath(game.image!),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withValues(alpha: 0.45),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        StylizedText(
                          text: context.l10n.congrats,
                          fontSize: 48.0,
                        ),

                        Text(
                          context.l10n.congratsSubTitle,
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
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 1.5,
                            wordSpacing: 1.5,
                          ),
                        ),

                        const Gap(32.0),

                        // star
                        WinStarWidget(
                          star: AppUtils.getScore(
                            secondsTaken: secondsElapsed,
                            totalSteps: totalMoves,
                            autoSolverSteps: autoSolverSteps,
                            puzzleSize: level,
                          ),
                        ),

                        const Gap(32.0),

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
                          text: AppUtils.getFormattedElapsedSeconds(
                            secondsElapsed,
                          ),
                        ),

                        const Gap(8.0),

                        ScoreTile(
                          icon: FontAwesomeIcons.laptopCode,
                          text: isAutoSolverUsed
                              ? context.l10n.usedAutosolve
                              : context.l10n.noAutosolve,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Gap(24.0),

          // share
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // share title text
                StylizedText(
                  text: context.l10n.share,
                  fontSize: 32.0,
                ),

                const Gap(32.0),

                // buttons
                ShareButtons(game: game, globalKey: globalKey),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

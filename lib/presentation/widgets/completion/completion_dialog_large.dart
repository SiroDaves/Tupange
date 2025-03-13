import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../blocs/puzzle/puzzle_bloc.dart';
import '../../blocs/timer/timer_bloc.dart';
import '../../cubits/menu/game_selection_cubit.dart';
import '../../cubits/menu/level_selection_cubit.dart';
import '../../cubits/puzzle/puzzle_helper_cubit.dart';
import '../../../data/models/game.dart';
import '../../../common/utils/app_localizationsx.dart';
import '../../../common/utils/games/utils_animal.dart';
import '../../../common/utils/games/utils_country.dart';
import '../../../common/utils/games/utils_county.dart';
import '../../../common/utils/games/utils_planet.dart';
import '../../../common/utils/games/utils_president.dart';
import '../../../common/utils/games/utils_vehicle.dart';
import '../../../common/utils/utils.dart';
import '../stylized_text.dart';
import 'completion_dialog.dart';

class CompletionDialogLarge extends StatelessWidget {
  final GlobalKey globalKey;

  const CompletionDialogLarge({
    Key? key,
    required this.globalKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondsElapsed = context.read<TimerBloc>().state.secondsElapsed;
    final totalMoves = context.read<PuzzleBloc>().state.numberOfMoves;
    final autoSolverSteps = context.read<PuzzleHelperCubit>().autoSolverSteps;
    final level = context.read<LevelSelectionCubit>().puzzleSize;
    final isAutoSolverUsed = autoSolverSteps != 0;

    final game = context.read<GameSelectionCubit>().game;

    final animal = context.read<GameSelectionCubit>().animal;
    final country = context.read<GameSelectionCubit>().country;
    final county = context.read<GameSelectionCubit>().county;
    final planet = context.read<GameSelectionCubit>().planet;
    final president = context.read<GameSelectionCubit>().president;
    final vehicle = context.read<GameSelectionCubit>().vehicle;

    var image = '';
    switch (game.type) {
      case GameType.animals:
        image = UtilsAnimal.image(animal.type);
        break;
      case GameType.countries:
        image = UtilsCountry.image(country.type);
        break;
      case GameType.counties:
        image = UtilsCounty.image(county.type);
        break;
      case GameType.planets:
        image = UtilsPlanet.image(planet.type);
        break;
      case GameType.presidents:
        image = UtilsPresident.image(president.type);
        break;
      case GameType.vehicles:
        image = UtilsVehicle.image(vehicle.type);
        break;
    }
    
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
                      child: Image.asset(image),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.45),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        StylizedText(
                          text: context.l10n!.congrats,
                          fontSize: 48.0,
                        ),

                        Text(
                          context.l10n!.congratsSubTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            letterSpacing: 2.0,
                          ),
                        ),

                        const Gap(32.0),

                        Text(
                          context.l10n!.successMessage(
                            planet.name,
                            Utils.getSuccessExtraText(
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
                          star: Utils.getScore(
                            secondsTaken: secondsElapsed,
                            totalSteps: totalMoves,
                            autoSolverSteps: autoSolverSteps,
                            puzzleSize: level,
                          ),
                        ),

                        const Gap(32.0),

                        StylizedText(
                          textAlign: TextAlign.center,
                          text: context.l10n!.scoreBoard,
                          fontSize: 24.0,
                          strokeWidth: 5.0,
                          offset: 2.0,
                        ),

                        const Gap(16.0),

                        ScoreTile(
                          icon: FontAwesomeIcons.hashtag,
                          text: context.l10n!.totalMoves(totalMoves),
                        ),

                        const Gap(8.0),

                        ScoreTile(
                          icon: FontAwesomeIcons.stopwatch,
                          text: Utils.getFormattedElapsedSeconds(
                            secondsElapsed,
                          ),
                        ),

                        const Gap(8.0),

                        ScoreTile(
                          icon: FontAwesomeIcons.laptopCode,
                          text: isAutoSolverUsed
                              ? context.l10n!.usedAutosolve
                              : context.l10n!.noAutosolve,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Gap(24.0),
        ],
      ),
    );
  }
}

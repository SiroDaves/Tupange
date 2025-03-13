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
import '../../../core/utils/app_localizationsx.dart';
import '../../../core/utils/games/utils_animal.dart';
import '../../../core/utils/games/utils_country.dart';
import '../../../core/utils/games/utils_county.dart';
import '../../../core/utils/games/utils_planet.dart';
import '../../../core/utils/games/utils_president.dart';
import '../../../core/utils/games/utils_vehicle.dart';
import '../../../core/utils/utils.dart';
import '../stylized_text.dart';
import 'completion_dialog.dart';

class CompletionDialogSmall extends StatelessWidget {
  final GlobalKey globalKey;

  const CompletionDialogSmall({
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

    final xOffset = -MediaQuery.of(context).size.width * 0.50;

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
    
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: Offset(xOffset, 0.0),
          child: Transform.scale(
            scale: 1.5,
            child: Image.asset(image),
          ),
        ),

        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.60),
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
                  text: context.l10n!.congrats,
                  strokeWidth: 4.0,
                  offset: 1.0,
                ),
              ),

              Text(
                context.l10n!.congratsSubTitle,
                textAlign: TextAlign.center,
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
                star: Utils.getScore(
                  secondsTaken: secondsElapsed,
                  totalSteps: totalMoves,
                  autoSolverSteps: autoSolverSteps,
                  puzzleSize: level,
                ),
              ),

              const Gap(38.0),

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
                text: Utils.getFormattedElapsedSeconds(secondsElapsed),
              ),

              const Gap(8.0),

              ScoreTile(
                icon: FontAwesomeIcons.laptopCode,
                text: isAutoSolverUsed
                    ? context.l10n!.usedAutosolve
                    : context.l10n!.noAutosolve,
              ),

              const Gap(38.0),
            ],
          ),
        ),
      ],
    );
  }
}

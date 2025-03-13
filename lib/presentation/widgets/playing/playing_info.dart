import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../cubits/menu/game_selection_cubit.dart';
import '../../cubits/puzzle/puzzle_helper_cubit.dart';
import '../../../data/models/game.dart';
import '../../../core/utils/app_localizationsx.dart';
import '../../../core/utils/games/utils_animal.dart';
import '../../../core/utils/games/utils_country.dart';
import '../../../core/utils/games/utils_county.dart';
import '../../../core/utils/games/utils_planet.dart';
import '../../../core/utils/games/utils_president.dart';
import '../../../core/utils/games/utils_vehicle.dart';
import '../layout/responsive_layout_builder.dart';
import '../stylized_icon.dart';
import '../stylized_text.dart';
import 'fact_widget.dart';

class PlayingInfo extends StatelessWidget {
  const PlayingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = context.read<GameSelectionCubit>().game;

    final animal = context.read<GameSelectionCubit>().animal;
    final country = context.read<GameSelectionCubit>().country;
    final county = context.read<GameSelectionCubit>().county;
    final planet = context.read<GameSelectionCubit>().planet;
    final president = context.read<GameSelectionCubit>().president;
    final vehicle = context.read<GameSelectionCubit>().vehicle;

    var title = '';
    switch (game.type) {
      case GameType.animals:
        title = UtilsAnimal.name(animal.type, context);
        break;
      case GameType.countries:
        title = UtilsCountry.name(country.type, context);
        break;
      case GameType.counties:
        title = UtilsCounty.name(county.type, context);
        break;
      case GameType.planets:
        title = UtilsPlanet.name(planet.type, context);
        break;
      case GameType.presidents:
        title = UtilsPresident.name(president.type, context);
        break;
      case GameType.vehicles:
        title = UtilsVehicle.name(vehicle.type, context);
        break;
    }

    return ResponsiveLayoutBuilder(
      small: (_, Widget? child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: child!,
      ),
      medium: (_, Widget? child) => child!,
      large: (_, Widget? child) => child!,
      child: (layoutSize) {
        final bool isLarge = layoutSize == ResponsiveLayoutSize.large;
        final bool isSmall = layoutSize == ResponsiveLayoutSize.small;

        return SizedBox(
          width: isSmall ? null : 500.0,
          height: isLarge
              ? 250
              : isSmall
                  ? 160
                  : 180,
          child: Column(
            crossAxisAlignment:
                isLarge ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: isLarge ? 48.0 : 32.0,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              ),
              // gap
              const Spacer(),

              // description
              FactWidget(
                key: const Key('fact-widget'),
                isLarge: isLarge,
                isSmall: isSmall,
              ),

              // gap
              const Spacer(),

              // puzzle optimize label
              context.read<PuzzleHelperCubit>().state.optimized
                  ? Tooltip(
                      message: context.l10n!.optimizedDescription,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      textStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14.0,
                        letterSpacing: 1.5,
                        wordSpacing: 2.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const StylizedIcon(
                            icon: FontAwesomeIcons.bolt,
                            color: Colors.redAccent,
                          ),
                          const Gap(12.0),
                          StylizedText(
                            text: context.l10n!.optimizedLabel,
                            textColor: Colors.redAccent,
                            strokeWidth: 4.0,
                            offset: 1.5,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}

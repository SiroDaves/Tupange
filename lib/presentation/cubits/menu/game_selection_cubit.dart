import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/game.dart';
import '../../../data/models/categories/animal.dart';
import '../../../data/models/categories/country.dart';
import '../../../data/models/categories/county.dart';
import '../../../data/models/categories/planet.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../../core/utils/constants/app_dimens.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/categories/president.dart';
import '../../../data/models/categories/vehicle.dart';
import '../../screens/puzzle/puzzle_screen.dart';
import 'category_selection_cubit.dart';
import 'level_selection_cubit.dart';

part 'game_selection_state.dart';

class GameSelectionCubit extends Cubit<GameSelectionState> {
  final LevelSelectionCubit levelSelectionCubit;
  final CategorySelectionCubit categorySelectionCubit;
  final BuildContext context;

  GameSelectionCubit(
      this.levelSelectionCubit, this.categorySelectionCubit, this.context)
      : super(NoGameSelected());

  late Game _game;
  late Animal _animal;
  late Country _country;
  late County _county;
  late Planet _planet;
  late President _president;
  late Vehicle _vehicle;

  Game get game => _game;
  Animal get animal => _animal;
  Country get country => _country;
  County get county => _county;
  Planet get planet => _planet;
  President get president => _president;
  Vehicle get vehicle => _vehicle;

  void onGameSelected(Game game) async {
    _game = game;
    _planet = AppConstants.planets[0];
    _country = AppConstants.countries[0];
    
    switch (game.type) {
      case GameType.animals:
        // TODO: Handle this case.
        break;
      case GameType.counties:
        // TODO: Handle this case.
        break;
      case GameType.countries:
        var countryNos = [0, 1, 2];
        countryNos.shuffle();
        _country = AppConstants.countries[countryNos[0]];
        break;
      case GameType.planets:
        var planetNos = [0, 1, 2, 3, 4, 5, 7, 8];
        planetNos.shuffle();
        _planet = AppConstants.planets[planetNos[0]];
        break;
      case GameType.presidents:
        // TODO: Handle this case.
        break;
      case GameType.vehicles:
        // TODO: Handle this case.
        break;
    }

    AppLogger.log(
      'GameSelectionCubit tapped: $game: category: ${categorySelectionCubit.state.category} level: ${levelSelectionCubit.state.level}',
    );

    final page = await Utils.buildPageAsync(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: categorySelectionCubit),
          BlocProvider.value(value: levelSelectionCubit),
          BlocProvider.value(value: this),
        ],
        child: const PuzzleScreen(key: Key('puzzle-page')),
      ),
    );

    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, anim, __, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
        transitionDuration: AppDimens.kMS800,
      ),
    );
  }
}

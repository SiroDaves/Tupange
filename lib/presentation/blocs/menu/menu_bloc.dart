import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/game.dart';
import '../../../data/models/categories/planet.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_dimens.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  List<Game> games = [];

  MenuBloc() : super(MenuLoading()) {
    on<MenuInitialized>(onMenuInit);
    on<MenuResized>(onMenuResized);
  }

  PlanetType getPlanetTypeAt(int index) {
    return PlanetType.values[index];
  }

  void generateGames() {
    games.add(
      const Game(
        key: 1,
        type: GameType.planets,
        image: AppAssets.planetsBg,
      ),
    );
    games.add(
      const Game(
        key: 2,
        type: GameType.countries,
        image: AppAssets.countriesBg,
      ),
    );
    games.add(
      const Game(
        key: 3,
        type: GameType.presidents,
        image: AppAssets.presidentsBg,
      ),
    );
    games.add(
      const Game(
        key: 4,
        type: GameType.animals,
        image: AppAssets.animalsBg,
      ),
    );
    games.add(
      const Game(
        key: 5,
        type: GameType.vehicles,
        image: AppAssets.vehiclesBg,
      ),
    );
    games.add(
      const Game(
        key: 5,
        type: GameType.counties,
        image: AppAssets.countiesBg,
      ),
    );
  }

  void onMenuResized(
    MenuResized event,
    Emitter<MenuState> emit,
  ) {
    emit(MenuReady(games));
  }

  void onMenuInit(
    MenuInitialized event,
    Emitter<MenuState> emit,
  ) {
    Size size = event.size;

    if (event.size.width < AppDimens.medium) {
      size = Size(AppDimens.medium, event.size.height);
    }

    generateGames();

    emit(MenuReady(games));
  }
}

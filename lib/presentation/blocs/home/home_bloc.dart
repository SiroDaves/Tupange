import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/di/injectable.dart';
import '../../../domain/repository/prefs_repository.dart';
import '../../../core/utils/constants/pref_constants.dart';
import '../../../data/datasources/remote/home_repository.dart';
import '../../../data/models/category.dart';
import '../../../data/models/game.dart';
import '../../../data/repository/database_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _HomeState()) {
    on<FetchData>(_onFetchData);
    on<SaveData>(_onSaveData);
  }

  final _homeRepo = HomeRepository();
  final _prefsRepo = getIt<PrefsRepository>();

  void _onFetchData(
    FetchData event,
    Emitter<HomeState> emit,
  ) async {
    List<Category> categories = [];
    List<Game> games = [];
    emit(const HomeLoadingState());

    categories = await _homeRepo.fetchCategories();
    games = await _homeRepo.fetchGames();

    if (categories.isNotEmpty) {
      emit(HomeFetchedState(categories, games));
    } else {
      emit(HomeFailureState('Could not fetch data'));
    }
  }

  void _onSaveData(
    SaveData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());

    final dbRepo = getIt<DatabaseRepository>();
    await dbRepo.removeAllCategories();
    await dbRepo.removeAllGames();

    for (final category in event.categories) {
      await dbRepo.saveCategory(category: category);
    }

    for (final game in event.games) {
      await dbRepo.saveGame(game: game);
    }

    await Future<void>.delayed(const Duration(seconds: 10));
    _prefsRepo.setPrefBool(PrefConstants.isOnboardedKey, true);

    emit(const HomeSuccessState());
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/planet.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../../core/utils/app_utils.dart';
import '../../screens/puzzle/puzzle_page.dart';
import '../level_selection/level_selection_cubit.dart';

part 'game_selection_state.dart';

class GameSelectionCubit extends Cubit<GameSelectionState> {
  final LevelSelectionCubit _levelSelectionCubit;
  final BuildContext _context;

  GameSelectionCubit(this._levelSelectionCubit, this._context)
      : super(NoPlanetSelected());

  late Planet _planet;

  Planet get planet => _planet;

  void onPlanetSelected(Planet planet) async {
    _planet = planet;

    AppUtils.logger(
      'GameSelectionCubit tapped: $planet: level: ${_levelSelectionCubit.state.level}',
    );

    final page = await AppUtils.buildPageAsync(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _levelSelectionCubit),
          BlocProvider.value(value: this),
        ],
        child: const PuzzlePage(key: Key('puzzle-page')),
      ),
    );

    await Navigator.push(
      _context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, anim, __, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
        transitionDuration: AppConstants.kMS800,
      ),
    );
  }
}

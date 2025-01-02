import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../blocs/puzzles/planet_puzzle_bloc.dart';

part 'puzzle_init_state.dart';

class PuzzleInitCubit extends Cubit<PuzzleInitState> {
  final PlanetPuzzleBloc _planetPuzzleBloc;
  final int _puzzleSize;

  int get _lastTileKey => _puzzleSize * _puzzleSize - 1;

  PuzzleInitCubit(this._puzzleSize, this._planetPuzzleBloc)
      : super(const PuzzleInitLoading());

  final Map<int, GlobalKey> _globalKeyMap = {};
  final Map<int, SimpleAnimation> _riveController = {};

  RiveAnimationController getRiveControllerFor(int tileKey) {
    if (tileKey == 0) {
      emit(const PuzzleInitLoading());
    }

    if (_riveController.containsKey(tileKey)) return _riveController[tileKey]!;

    final controller = SimpleAnimation(
      AppUtils.planetRotationAnimationName,
      autoplay: false,
    );
    _riveController[tileKey] = controller;

    return controller;
  }

  GlobalKey getGlobalKey(int tileKey) {
    if (_globalKeyMap.containsKey(tileKey)) return _globalKeyMap[tileKey]!;

    final globalKey = GlobalKey(debugLabel: 'GlobalKey for $tileKey');
    _globalKeyMap[tileKey] = globalKey;
    return globalKey;
  }

  void _startAnimating() async {
    // for performance reasons
    await Future.delayed(AppConstants.kMS250);

    _riveController.forEach((_, controller) {
      controller.reset();
      if (!controller.isActive) {
        controller.isActive = true;
      }
    });

    if (!isClosed) emit(const PuzzleInitReady());
  }

  void onInit(int tileKey) {
    final hasStarted =
        _planetPuzzleBloc.state.status == PlanetPuzzleStatus.started;

    AppUtils.logger('puzzle_init_cubit: onInit: hasStarted: $hasStarted');

    if (tileKey == _lastTileKey) {
      _startAnimating();
    }

    if (hasStarted && tileKey == _lastTileKey - 1) {
      // during the game, if screen is resized
      _startAnimating();
    }
  }
}

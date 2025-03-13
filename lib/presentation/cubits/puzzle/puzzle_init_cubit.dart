import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_logger.dart';
import '../../../core/utils/constants/app_dimens.dart';
import '../../blocs/playing/playing_bloc.dart';

part 'puzzle_init_state.dart';

class PuzzleInitCubit extends Cubit<PuzzleInitState> {
  final GameBloc _planetPuzzleBloc;
  final int _puzzleSize;

  int get _lastTileKey => _puzzleSize * _puzzleSize - 1;

  PuzzleInitCubit(this._puzzleSize, this._planetPuzzleBloc)
      : super(const PuzzleInitLoading());

  final Map<int, GlobalKey> _globalKeyMap = {};
  
  GlobalKey getGlobalKey(int tileKey) {
    if (_globalKeyMap.containsKey(tileKey)) return _globalKeyMap[tileKey]!;

    final globalKey = GlobalKey(debugLabel: 'GlobalKey for $tileKey');
    _globalKeyMap[tileKey] = globalKey;
    return globalKey;
  }

  void setReady() async {
    // for performance reasons
    await Future.delayed(AppDimens.kMS250);

    if (!isClosed) emit(const PuzzleInitReady());
  }

  void onInit(int tileKey) {
    final hasStarted =
        _planetPuzzleBloc.state.status == PlayingStatus.started;

    AppLogger.log('puzzle_init_cubit: onInit: hasStarted: $hasStarted');

    if (tileKey == _lastTileKey) {
      setReady();
    }

    if (hasStarted && tileKey == _lastTileKey - 1) {
      // during the playing, if screen is resized
      setReady();
    }
  }
}

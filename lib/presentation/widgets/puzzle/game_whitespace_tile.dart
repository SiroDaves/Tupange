import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_utils.dart';
import '../../../data/models/tile.dart';
import '../../blocs/game/game_puzzle_bloc.dart';
import 'game_puzzle_tile.dart';

class GameWhitespaceTile extends StatelessWidget {
  final Tile tile;

  const GameWhitespaceTile({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    final status = context.select((GamePuzzleBloc bloc) => bloc.state.status);
    final hasStarted = status == GamePuzzleStatus.started;

    AppUtils.logger('GameWhitespaceTile: hasStarted $hasStarted');

    return hasStarted
        ? const SizedBox.shrink()
        : GamePuzzleTile(
            key: ValueKey(tile.value),
            tile: tile,
          );
  }
}

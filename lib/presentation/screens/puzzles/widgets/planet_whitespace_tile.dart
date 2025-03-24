import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../../data/models/tile.dart';
import '../../../blocs/puzzles/planet_puzzle_bloc.dart';
import 'planet_puzzle_tile.dart';

class PlanetWhitespaceTile extends StatelessWidget {
  final Tile tile;

  const PlanetWhitespaceTile({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    final status = context.select((PlanetPuzzleBloc bloc) => bloc.state.status);
    final hasStarted = status == PlanetPuzzleStatus.started;

    AppUtils.logger('PlanetWhitespaceTile: hasStarted $hasStarted');

    return hasStarted
        ? const SizedBox.shrink()
        : PlanetPuzzleTile(
            key: ValueKey(tile.value),
            tile: tile,
          );
  }
}

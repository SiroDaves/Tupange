import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/tile.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../blocs/puzzles/planet_puzzle_bloc.dart';
import 'planet_puzzle_tile.dart';

class PlanetWhitespaceTile extends StatelessWidget {
  final Tile tile;

  const PlanetWhitespaceTile({Key? key, required this.tile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((PlanetPuzzleBloc bloc) => bloc.state.status);
    final hasStarted = status == PlanetPuzzleStatus.started;

    AppLogger.log('PlanetWhitespaceTile: hasStarted $hasStarted');

    return hasStarted
        ? const SizedBox.shrink()
        : PlanetPuzzleTile(
            key: ValueKey(tile.value),
            tile: tile,
          );
  }
}

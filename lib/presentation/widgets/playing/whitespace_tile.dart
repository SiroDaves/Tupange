import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/playing/playing_bloc.dart';
import '../../../data/models/tile.dart';
import '../../../core/utils/app_logger.dart';
import 'playing_tile.dart';

class WhitespaceTile extends StatelessWidget {
  final Tile tile;

  const WhitespaceTile({Key? key, required this.tile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((GameBloc bloc) => bloc.state.status);
    final hasStarted = status == PlayingStatus.started;

    AppLogger.log('WhitespaceTile: hasStarted $hasStarted');

    return hasStarted
        ? const SizedBox.shrink()
        : PlayingTile(
            key: ValueKey(tile.value),
            tile: tile,
          );
  }
}

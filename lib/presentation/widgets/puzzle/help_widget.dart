import 'package:flutter/material.dart';

import '../../../core/utils/constants/app_constants.dart';
import '../../../core/utils/puzzle_utils.dart';
import '../../../data/models/tile.dart';
import '../general/stylized_text.dart';

class HelpWidget extends StatelessWidget {
  final Tile tile;
  final bool showHelp;
  final double size;

  const HelpWidget({
    super.key,
    required this.tile,
    required this.showHelp,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final correctX = tile.correctPosition.x;
    final correctY = tile.correctPosition.y;

    final offset = size / tile.puzzleSize;

    const containerSize = 40.0;

    return Transform.translate(
      offset: Offset(
        ((correctX + 1 / 2) * offset) - containerSize / 2,
        ((correctY + 1 / 2) * offset) - containerSize / 2,
      ),
      child: AnimatedSwitcher(
        duration: AppConstants.kMS250,
        reverseDuration: AppConstants.kMS250,
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: showHelp
            ? Container(
                key: Key('helper_widget_${tile.value}'),
                width: containerSize,
                height: containerSize,
                alignment: Alignment.center,
                child: StylizedText(
                  text: '${tile.value + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: tile.puzzleSize == 3 ? 35.0 : 20.0,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class PuzzlePieceClipper extends CustomClipper<Path> {
  final Tile tile;

  const PuzzlePieceClipper(this.tile);

  @override
  Path getClip(Size size) {
    return PuzzleUtils.getPuzzlePath(size, tile.puzzleSize, tile.correctPosition);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class KeyWidget extends StatelessWidget {
  final Widget child;

  const KeyWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

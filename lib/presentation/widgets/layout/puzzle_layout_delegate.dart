import 'package:flutter/material.dart';

import '../../blocs/puzzle/puzzle_bloc.dart';
import '../../../data/models/tile.dart';
import '../controls/puzzle_control.dart';
import 'responsive_gap.dart';
import '../playing/playing_board.dart';
import '../playing/playing_info.dart';
import '../playing/playing_stats.dart';
import '../playing/playing_tile.dart';
import '../playing/whitespace_tile.dart';
import 'puzzle_layout.dart';

abstract class BoardSize {
  static double small = 312;
  static double medium = 424;
  static double large = 512;
}

class PuzzleLayoutDelegate extends PuzzleLayout {
  double getPercentageOfPuzzleSolved(PuzzleState puzzleState) {
    final tiles = puzzleState.puzzle.tiles;

    /// let empty puzzle be always 100% solved
    if (tiles.isEmpty) return 1.0;

    int correctlyPlaced = 0;

    for (final tile in tiles) {
      if (tile.currentPosition == tile.correctPosition) {
        correctlyPlaced++;
      }
    }

    return correctlyPlaced / (tiles.length);
  }

  @override
  Widget boardBuilder(int size, List<Widget> tiles) {
    return Column(
      children: [
        const ResponsiveGap(
          small: 48,
          medium: 32,
          large: 96,
        ),
        PlayingBoard(tiles: tiles),
        const ResponsiveGap(
          small: 48,
          medium: 32,
          large: 96,
        ),
      ],
    );
  }

  @override
  Widget controlBuilder() {
    return const PuzzleControl();
  }

  @override
  Widget infoBuilder() {
    return const PlayingInfo();
  }

  @override
  Widget statsBuilder() {
    return const PlayingStats();
  }

  @override
  Widget tileBuilder(Tile tile) {
    return PlayingTile(key: ValueKey(tile.value), tile: tile);
  }

  @override
  Widget whitespaceTileBuilder(Tile tile) {
    return WhitespaceTile(tile: tile);
  }

  @override
  List<Object?> get props => [];
}

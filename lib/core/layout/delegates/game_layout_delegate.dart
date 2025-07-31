import 'package:flutter/material.dart';

import '../../../data/models/tile.dart';
import '../../../presentation/blocs/puzzle/puzzle_bloc.dart';
import '../../../presentation/theme/themes/puzzle_theme.dart';
import '../../../presentation/widgets/controls/puzzle_control.dart';
import '../../../presentation/widgets/puzzle/game_puzzle_tile.dart';
import '../../../presentation/widgets/puzzle/game_whitespace_tile.dart';
import '../../../presentation/widgets/puzzle/puzzle_board.dart';
import '../../../presentation/widgets/puzzle/puzzle_info.dart';
import '../../../presentation/widgets/puzzle/puzzle_stats.dart';
import '../../utils/app_utils.dart';
import '../../utils/constants/app_constants.dart';
import '../utils/responsive_gap.dart';
import '../utils/responsive_layout_builder.dart';
import 'puzzle_layout_delegate.dart';

abstract class BoardSize {
  static double small = 312;
  static double medium = 424;
  static double large = 512;
}

class GameLayoutDelegate extends PuzzleLayoutDelegate {
  double _getPercentageOfPuzzleSolved(PuzzleState puzzleState) {
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
  Widget backgroundBuilder(PuzzleTheme theme, PuzzleState puzzleState) {
    final percentageSolved = _getPercentageOfPuzzleSolved(puzzleState);
    AppUtils.logger('PuzzleLayoutDelegate :: $percentageSolved');

    final landscapeWidget = _LandscapeWidget(theme: theme);

    return Stack(
      children: [
        ColorFiltered(
          colorFilter: AppConstants.kGreyscaleColorFilter,
          child: landscapeWidget,
        ),

        /// If `percentageSolved` is 30% then
        /// we hide the first 30% of the following widget
        ClipRect(
          child: AnimatedAlign(
            duration: percentageSolved > 0.85 ? AppConstants.kMS800 : AppConstants.kS4,
            alignment: Alignment.centerLeft,
            widthFactor: percentageSolved,
            child: landscapeWidget,
          ),
        ),
      ],
    );
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
        PuzzleBoard(tiles: tiles),
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
    return const PuzzleInfo();
  }

  @override
  Widget statsBuilder() {
    return const PuzzleStats();
  }

  @override
  Widget tileBuilder(Tile tile) {
    return GamePuzzleTile(key: ValueKey(tile.value), tile: tile);
  }

  @override
  Widget whitespaceTileBuilder(Tile tile) {
    return GameWhitespaceTile(tile: tile);
  }

  @override
  List<Object?> get props => [];
}

class _LandscapeWidget extends StatelessWidget {
  final PuzzleTheme theme;
  const _LandscapeWidget({required this.theme});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      key: const Key('game_landscape'),
      small: (_, Widget? child) => Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          theme.backgroundAsset,
          height: 120.0,
          fit: BoxFit.cover,
        ),
      ),
      medium: (_, Widget? child) => child!,
      large: (_, Widget? child) => child!,
      child: (_) => Align(
        alignment: Alignment.bottomCenter,
        child: Builder(builder: (context) {
          return Image.asset(
            theme.backgroundAsset,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          );
        }),
      ),
    );
  }
}

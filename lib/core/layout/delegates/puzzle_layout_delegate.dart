import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/tile.dart';
import '../../../presentation/blocs/puzzle/puzzle_bloc.dart';
import '../../../presentation/theme/themes/puzzle_theme.dart';

abstract class PuzzleLayoutDelegate extends Equatable {
  const PuzzleLayoutDelegate();

  Widget infoBuilder();

  Widget statsBuilder();

  Widget controlBuilder();

  Widget backgroundBuilder(PuzzleTheme theme, PuzzleState puzzleState);

  Widget boardBuilder(int size, List<Widget> tiles);

  Widget tileBuilder(Tile tile);

  Widget whitespaceTileBuilder(Tile tile);
}

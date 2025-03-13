import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/tile.dart';

abstract class PuzzleLayout extends Equatable {
  const PuzzleLayout();

  Widget infoBuilder();

  Widget statsBuilder();

  Widget controlBuilder();

  Widget boardBuilder(int size, List<Widget> tiles);

  Widget tileBuilder(Tile tile);

  Widget whitespaceTileBuilder(Tile tile);
}

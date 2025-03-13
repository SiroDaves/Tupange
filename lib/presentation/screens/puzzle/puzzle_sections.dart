import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../blocs/theme/theme_bloc.dart';

import '../../widgets/layout/responsive_layout_builder.dart';
import 'puzzle_board.dart';

class PuzzleSections extends StatefulWidget {
  const PuzzleSections({Key? key}) : super(key: key);

  @override
  State<PuzzleSections> createState() => _PuzzleSectionsState();
}

class _PuzzleSectionsState extends State<PuzzleSections> {
  final _puzzleBoardKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);

    return ResponsiveLayoutBuilder(
      small: (_, Widget? child) => Center(
        child: Column(
          children: [
            theme.puzzleLayoutDelegate.infoBuilder(),
            theme.puzzleLayoutDelegate.statsBuilder(),
            child!,
            theme.puzzleLayoutDelegate.controlBuilder(),
          ],
        ),
      ),
      medium: (_, Widget? child) => Row(
        children: [
          Expanded(
            child: Column(
              children: [
                theme.puzzleLayoutDelegate.infoBuilder(),
                const Gap(25.0),
                theme.puzzleLayoutDelegate.statsBuilder(),
                const Gap(25.0),
                theme.puzzleLayoutDelegate.controlBuilder(),
              ],
            ),
          ),

          // puzzle board
          Expanded(child: child!),
        ],
      ),
      large: (_, Widget? child) => Row(
        children: [
          Expanded(
            child: Column(
              children: [
                theme.puzzleLayoutDelegate.infoBuilder(),
                const Gap(48.0),
                theme.puzzleLayoutDelegate.statsBuilder(),
                const Gap(48.0),
                theme.puzzleLayoutDelegate.controlBuilder(),
              ],
            ),
          ),
          Expanded(child: child!),
        ],
      ),
      child: (_) => PuzzleBoard(key: _puzzleBoardKey),
    );
  }
}

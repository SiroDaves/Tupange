import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart' as rive;

import '../../../../core/layout/utils/app_breakpoints.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/puzzle_utils.dart';
import '../../../../data/models/tile.dart';
import '../../../blocs/puzzle/puzzle_bloc.dart';
import '../../../blocs/puzzles/planet_puzzle_bloc.dart';
import '../../../cubits/puzzle_helper/puzzle_helper_cubit.dart';
import '../../../cubits/puzzle_init/puzzle_init_cubit.dart';
import '../../../theme/bloc/theme_bloc.dart';
import '../../../widgets/shake_animator.dart';
import '../../../widgets/stylized_text.dart';
import '../layout/planet_puzzle_layout_delegate.dart';

class PlanetPuzzleTile extends StatefulWidget {
  final Tile tile;

  const PlanetPuzzleTile({super.key, required this.tile});

  @override
  State<PlanetPuzzleTile> createState() => _PlanetPuzzleTileState();
}

class _PlanetPuzzleTileState extends State<PlanetPuzzleTile> {
  final childVn = ValueNotifier<Widget?>(null);
  late ThemeBloc themeBloc;
  late PuzzleInitCubit puzzleInitCubit;
  Timer? _timer;

  double scale = 1.0;

  void _onHovering(bool isHovering) {
    setState(() {
      scale = isHovering ? 0.9 : 1.0;
    });
  }

  double get size {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= AppBreakpoints.small) {
      return BoardSize.small;
    }

    if (screenWidth <= AppBreakpoints.medium) {
      return BoardSize.medium;
    }

    return BoardSize.large;
  }

  _buildChild() {
    final theme = themeBloc.state.theme;

    if (context.read<PuzzleHelperCubit>().state.optimized) {
      // if we need to play optimized puzzle, just show images, instead of animations
      childVn.value = _KeyWidget(
        key: puzzleInitCubit.getGlobalKey(widget.tile.value),
        child: Image.asset(theme.placeholderAssetForTile),
      );
      puzzleInitCubit.onInit(widget.tile.value);
    } else {
      // show animations if we don't wanna play optimized puzzle
      childVn.value = _KeyWidget(
        key: puzzleInitCubit.getGlobalKey(widget.tile.value),
        child: rive.RiveAnimation.asset(
          theme.assetForTile,
          controllers: [
            puzzleInitCubit.getRiveControllerFor(widget.tile.value)
          ],
          onInit: (_) => puzzleInitCubit.onInit(widget.tile.value),
          fit: BoxFit.cover,
          placeHolder: Image.asset(
            theme.placeholderThumbnail,
            fit: BoxFit.fill,
            height: size,
            width: size,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    themeBloc = context.read<ThemeBloc>();
    puzzleInitCubit = context.read<PuzzleInitCubit>();
    _timer = Timer(AppConstants.kMS800, _buildChild);
  }

  @override
  void dispose() {
    _timer?.cancel();
    puzzleInitCubit.getRiveControllerFor(widget.tile.value).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubitState = context.select((PuzzleInitCubit cubit) => cubit.state);
    final isReady = cubitState is PuzzleInitReady;

    final puzzleBloc = context.select((PuzzleBloc bloc) => bloc);
    final puzzleIncomplete =
        puzzleBloc.state.puzzleStatus == PuzzleStatus.incomplete;

    final puzzleHelperState =
        context.select((PuzzleHelperCubit cubit) => cubit.state);
    final isAutoSolving = puzzleHelperState.isAutoSolving;
    final showHelp = puzzleHelperState.showHelp;

    AppUtils.logger('PlanetPuzzleTile: updated: isAutoSolving: $isAutoSolving');

    final status = context.select((PlanetPuzzleBloc bloc) => bloc.state.status);
    final hasStarted = status == PlanetPuzzleStatus.started;

    final movementDuration =
        status == PlanetPuzzleStatus.loading ? AppConstants.kMS800 : AppConstants.kMS350;

    final canPress = hasStarted && puzzleIncomplete && !isAutoSolving;

    final offset = size / widget.tile.puzzleSize;
    final x = widget.tile.currentPosition.x;
    final y = widget.tile.currentPosition.y;

    final correctX = widget.tile.correctPosition.x;
    final correctY = widget.tile.correctPosition.y;

    final isInCorrectPosition = (x == correctX) && (y == correctY);

    return AnimatedPositioned(
      duration: movementDuration,
      curve: Curves.easeInOut,
      top: offset * (y - correctY),
      left: offset * (x - correctX),
      child: ShakeAnimator(
        controller: puzzleBloc.getShakeControllerFor(
          widget.tile.value,
        ),
        child: AnimatedScale(
          scale: scale,
          curve: Curves.easeInOut,
          duration: AppConstants.kMS250,
          alignment: FractionalOffset(
            ((correctX + 1 / 2) * offset) / size,
            ((correctY + 1 / 2) * offset) / size,
          ),
          child: ClipPath(
            clipper: _PuzzlePieceClipper(widget.tile),
            child: MouseRegion(
              cursor: canPress
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.forbidden,
              onEnter: (_) {
                if (canPress) _onHovering(true);
              },
              onExit: (_) {
                _onHovering(false);
              },
              child: GestureDetector(
                onTap: () {
                  if (canPress) {
                    context.read<PuzzleBloc>().add(TileTapped(widget.tile));
                  }
                },
                child: SizedBox.square(
                  dimension: size,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: [
                        ValueListenableBuilder<Widget?>(
                          valueListenable: childVn,
                          builder: (_, child, __) {
                            if (child == null) return const SizedBox.shrink();
                            return isInCorrectPosition
                                ? child
                                : ColorFiltered(
                                    colorFilter: AppConstants.kGreyscaleColorFilter,
                                    child: child,
                                  );
                          },
                        ),
                        !isReady
                            ? SizedBox.square(
                                key: const Key('puzzle_tile_image'),
                                dimension: size,
                                child: Image.asset(
                                  themeBloc.state.theme.placeholderThumbnail,
                                  height: size,
                                  width: size,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : const SizedBox.shrink(),
                        _HelpWidget(
                          key: ValueKey(widget.tile.value),
                          tile: widget.tile,
                          showHelp: showHelp,
                          size: size,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HelpWidget extends StatelessWidget {
  final Tile tile;
  final bool showHelp;
  final double size;

  const _HelpWidget({
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

class _PuzzlePieceClipper extends CustomClipper<Path> {
  final Tile tile;

  const _PuzzlePieceClipper(this.tile);

  @override
  Path getClip(Size size) {
    return PuzzleUtils.getPuzzlePath(size, tile.puzzleSize, tile.correctPosition);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class _KeyWidget extends StatelessWidget {
  final Widget child;

  const _KeyWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

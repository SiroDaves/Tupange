import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/game.dart';
import '../../cubits/level/level_selection_cubit.dart';
import '../../cubits/game/game_selection_cubit.dart';
import '../info_card/info_card.dart';

class HomeKeyboardHandler extends StatefulWidget {
  final Widget child;

  const HomeKeyboardHandler({super.key, required this.child});

  @override
  HomeKeyboardHandlerState createState() => HomeKeyboardHandlerState();
}

class HomeKeyboardHandlerState extends State<HomeKeyboardHandler> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void openGameAt(Game game) =>
      context.read<GameSelectionCubit>().onPlanetSelected(game);

  /// For the dashboard, the following keyboard events are important
  /// [Space] key -> play/pause planet orbital animation
  /// [LeftArrow] key -> decrease difficulty level
  /// [RightArrow] key -> increase difficulty level
  /// [i] key -> show info card
  /// [1 - 9] num key -> choose a planet (Mercury - Pluto)
  /// [esc] key -> close dialog
  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final physicalKey = event.data.physicalKey;

      if (physicalKey == PhysicalKeyboardKey.space) {
        // context.read<GameSelectionHelperCubit>().onPlanetMovementToggle();
      } else if (physicalKey == PhysicalKeyboardKey.arrowLeft) {
        context.read<LevelSelectionCubit>().onLevelDecrease();
      } else if (physicalKey == PhysicalKeyboardKey.arrowRight) {
        context.read<LevelSelectionCubit>().onLevelIncrease();
      } else if (physicalKey == PhysicalKeyboardKey.keyI) {
        InfoCard.show(context: context);
      } /*else if (physicalKey == PhysicalKeyboardKey.digit1) {
        openPlanetAt(1);
      } else if (physicalKey == PhysicalKeyboardKey.digit2) {
        openPlanetAt(2);
      } else if (physicalKey == PhysicalKeyboardKey.digit3) {
        openPlanetAt(3);
      } else if (physicalKey == PhysicalKeyboardKey.digit4) {
        openPlanetAt(4);
      } else if (physicalKey == PhysicalKeyboardKey.digit5) {
        openPlanetAt(5);
      } else if (physicalKey == PhysicalKeyboardKey.digit6) {
        openPlanetAt(6);
      } else if (physicalKey == PhysicalKeyboardKey.digit7) {
        openPlanetAt(7);
      } else if (physicalKey == PhysicalKeyboardKey.digit8) {
        openPlanetAt(8);
      } else if (physicalKey == PhysicalKeyboardKey.digit9) {
        openPlanetAt(9);
      } */else if (physicalKey == PhysicalKeyboardKey.escape) {
        final navigatorState = Navigator.of(context);
        if (navigatorState.canPop()) navigatorState.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _handleKeyEvent,
      child: Builder(builder: (context) {
        if (!_focusNode.hasFocus) {
          FocusScope.of(context).requestFocus(_focusNode);
        }
        return widget.child;
      }),
    );
  }
}

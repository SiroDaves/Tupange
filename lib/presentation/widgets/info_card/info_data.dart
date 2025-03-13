import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/utils/app_localizationsx.dart';
import 'info_pair.dart';

class InfoData {
  final String title;
  final List<InfoPair> infoPairs;

  const InfoData({
    required this.title,
    required this.infoPairs,
  });
}

abstract class AppShortcutData {
  static List<InfoData> data(BuildContext context) => [
        // app shortcuts
        /// [m] key -> mute/unmute music
        /// [s] key -> mute/unmute sound effect
        InfoData(
          title: context.l10n!.appShortcuts,
          infoPairs: [
            InfoPair(
              titleText: 'M',
              description: context.l10n!.appShortcutMusic,
            ),
            InfoPair(
              titleText: 'S',
              description: context.l10n!.appShortcutSoundEffect,
            ),
          ],
        ),

        // menu shortcuts
        /// [Space] key -> play/pause planet orbital animation
        /// [LeftArrow] key -> decrease difficulty level
        /// [RightArrow] key -> increase difficulty level
        /// [i] key -> show info card
        /// [1 - 9] num key -> choose a planet (Mercury - Pluto)
        /// [esc] key -> close dialog
        InfoData(
          title: context.l10n!.menuShortcuts,
          infoPairs: [
            InfoPair(
              showIcon: true,
              titleIcon: Icons.space_bar_rounded,
              description: context.l10n!.menuShortcutOrbitalAnimation,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowLeft,
              description: context.l10n!.menuShortcutDiffDec,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowRight,
              description: context.l10n!.menuShortcutDiffInc,
            ),
            InfoPair(
              titleText: 'i',
              description: context.l10n!.menuShortcutDialogInfo,
            ),
            InfoPair(
              titleText: '1 - 9',
              description: context.l10n!.menuShortcutChooseAPlanet,
            ),
            InfoPair(
              titleText: 'ESC',
              description: context.l10n!.menuShortcutClose,
            ),
          ],
        ),

        // puzzle page shortcuts
        /// [Space] Start / Auto Solve / Stop
        /// [R] key -> restart
        /// [V] key -> toggle visibility of helpers (numbers)
        /// [UpArrow] key -> move whitespace up
        /// [DownArrow] key -> move whitespace down
        /// [LeftArrow] key -> move whitespace left
        /// [RightArrow] key -> move whitespace right
        /// [esc] key -> move back to solar system
        InfoData(
          title: context.l10n!.puzzleShortcuts,
          infoPairs: [
            InfoPair(
              showIcon: true,
              titleIcon: Icons.space_bar_rounded,
              description: context.l10n!.puzzleShortcutControl,
            ),
            InfoPair(
              titleText: 'R',
              description: context.l10n!.puzzleShortcutRestart,
            ),
            InfoPair(
              titleText: 'V',
              description: context.l10n!.puzzleShortcutHintVisibility,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowUp,
              description: context.l10n!.whitespaceUp,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowDown,
              description: context.l10n!.whitespaceDown,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowLeft,
              description: context.l10n!.whitespaceLeft,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowRight,
              description: context.l10n!.whitespaceRight,
            ),
            InfoPair(
              titleText: 'ESC',
              description: context.l10n!.backToSolarSystem,
            ),
          ],
        ),
      ];
}

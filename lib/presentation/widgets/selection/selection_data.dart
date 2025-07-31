part of 'selection_card.dart';

class SelectionData {
  final String title;
  final List<SelectionPair> infoPairs;

  const SelectionData({
    required this.title,
    required this.infoPairs,
  });
}

abstract class AppShortcutData {
  static List<SelectionData> data(BuildContext context) => [
        SelectionData(
          title: context.l10n.appShortcuts,
          infoPairs: [
            SelectionPair(
              titleText: 'M',
              description: context.l10n.appShortcutMusic,
            ),
            SelectionPair(
              titleText: 'S',
              description: context.l10n.appShortcutSoundEffect,
            ),
          ],
        ),
        SelectionData(
          title: context.l10n.dashboardShortcuts,
          infoPairs: [
            SelectionPair(
              showIcon: true,
              titleIcon: Icons.space_bar_rounded,
              description: context.l10n.dashboardShortcutOrbitalAnimation,
            ),
            SelectionPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowLeft,
              description: context.l10n.dashboardShortcutDiffDec,
            ),
          ],
        ),
        SelectionData(
          title: context.l10n.puzzleShortcuts,
          infoPairs: [
            SelectionPair(
              showIcon: true,
              titleIcon: Icons.space_bar_rounded,
              description: context.l10n.puzzleShortcutControl,
            ),
            SelectionPair(
              titleText: 'R',
              description: context.l10n.puzzleShortcutRestart,
            ),
            SelectionPair(
              titleText: 'V',
              description: context.l10n.puzzleShortcutHintVisibility,
            ),
            SelectionPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowUp,
              description: context.l10n.whitespaceUp,
            ),
            SelectionPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowDown,
              description: context.l10n.whitespaceDown,
            ),
            SelectionPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowLeft,
              description: context.l10n.whitespaceLeft,
            ),
            SelectionPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowRight,
              description: context.l10n.whitespaceRight,
            ),
            SelectionPair(
              titleText: 'ESC',
              description: context.l10n.backToSolarSystem,
            ),
          ],
        ),
      ];
}

class SelectionPair {
  final IconData titleIcon;
  final String titleText;
  final String description;
  final bool showIcon;

  const SelectionPair({
    this.titleIcon = FontAwesomeIcons.info,
    this.titleText = '',
    required this.description,
    this.showIcon = false,
  });
}

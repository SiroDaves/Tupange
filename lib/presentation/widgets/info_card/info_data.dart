part of 'info_card.dart';

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
        InfoData(
          title: context.l10n.appShortcuts,
          infoPairs: [
            InfoPair(
              titleText: 'M',
              description: context.l10n.appShortcutMusic,
            ),
            InfoPair(
              titleText: 'S',
              description: context.l10n.appShortcutSoundEffect,
            ),
          ],
        ),
        InfoData(
          title: context.l10n.dashboardShortcuts,
          infoPairs: [
            InfoPair(
              showIcon: true,
              titleIcon: Icons.space_bar_rounded,
              description: context.l10n.dashboardShortcutOrbitalAnimation,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowLeft,
              description: context.l10n.dashboardShortcutDiffDec,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowRight,
              description: context.l10n.dashboardShortcutDiffInc,
            ),
            InfoPair(
              titleText: 'i',
              description: context.l10n.dashboardShortcutInfo,
            ),
            InfoPair(
              titleText: 'ESC',
              description: context.l10n.dashboardShortcutClose,
            ),
          ],
        ),
        InfoData(
          title: context.l10n.puzzleShortcuts,
          infoPairs: [
            InfoPair(
              showIcon: true,
              titleIcon: Icons.space_bar_rounded,
              description: context.l10n.puzzleShortcutControl,
            ),
            InfoPair(
              titleText: 'R',
              description: context.l10n.puzzleShortcutRestart,
            ),
            InfoPair(
              titleText: 'V',
              description: context.l10n.puzzleShortcutHintVisibility,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowUp,
              description: context.l10n.whitespaceUp,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowDown,
              description: context.l10n.whitespaceDown,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowLeft,
              description: context.l10n.whitespaceLeft,
            ),
            InfoPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowRight,
              description: context.l10n.whitespaceRight,
            ),
            InfoPair(
              titleText: 'ESC',
              description: context.l10n.backToSolarSystem,
            ),
          ],
        ),
      ];
}

class InfoPair {
  final IconData titleIcon;
  final String titleText;
  final String description;
  final bool showIcon;

  const InfoPair({
    this.titleIcon = FontAwesomeIcons.info,
    this.titleText = '',
    required this.description,
    this.showIcon = false,
  });
}

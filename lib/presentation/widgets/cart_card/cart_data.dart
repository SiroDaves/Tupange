part of 'cart_card.dart';

class CartData {
  final String title;
  final List<CartPair> infoPairs;

  const CartData({
    required this.title,
    required this.infoPairs,
  });
}

abstract class AppShortcutData {
  static List<CartData> data(BuildContext context) => [
        CartData(
          title: context.l10n.appShortcuts,
          infoPairs: [
            CartPair(
              titleText: 'M',
              description: context.l10n.appShortcutMusic,
            ),
            CartPair(
              titleText: 'S',
              description: context.l10n.appShortcutSoundEffect,
            ),
          ],
        ),
        CartData(
          title: context.l10n.dashboardShortcuts,
          infoPairs: [
            CartPair(
              showIcon: true,
              titleIcon: Icons.space_bar_rounded,
              description: context.l10n.dashboardShortcutOrbitalAnimation,
            ),
            CartPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowLeft,
              description: context.l10n.dashboardShortcutDiffDec,
            ),
            CartPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowRight,
              description: context.l10n.dashboardShortcutDiffInc,
            ),
            CartPair(
              titleText: 'i',
              description: context.l10n.dashboardShortcutInfo,
            ),
            CartPair(
              titleText: 'ESC',
              description: context.l10n.dashboardShortcutClose,
            ),
          ],
        ),
        CartData(
          title: context.l10n.puzzleShortcuts,
          infoPairs: [
            CartPair(
              showIcon: true,
              titleIcon: Icons.space_bar_rounded,
              description: context.l10n.puzzleShortcutControl,
            ),
            CartPair(
              titleText: 'R',
              description: context.l10n.puzzleShortcutRestart,
            ),
            CartPair(
              titleText: 'V',
              description: context.l10n.puzzleShortcutHintVisibility,
            ),
            CartPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowUp,
              description: context.l10n.whitespaceUp,
            ),
            CartPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowDown,
              description: context.l10n.whitespaceDown,
            ),
            CartPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowLeft,
              description: context.l10n.whitespaceLeft,
            ),
            CartPair(
              showIcon: true,
              titleIcon: FontAwesomeIcons.arrowRight,
              description: context.l10n.whitespaceRight,
            ),
            CartPair(
              titleText: 'ESC',
              description: context.l10n.backToSolarSystem,
            ),
          ],
        ),
      ];
}

class CartPair {
  final IconData titleIcon;
  final String titleText;
  final String description;
  final bool showIcon;

  const CartPair({
    this.titleIcon = FontAwesomeIcons.info,
    this.titleText = '',
    required this.description,
    this.showIcon = false,
  });
}

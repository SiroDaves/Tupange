import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/helpers/modal_helpers.dart';
import '../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../core/l10n/l10n.dart';
import '../../../data/models/category.dart';
import '../../../data/models/game.dart';
import '../general/stylized_icon.dart';
import '../general/stylized_text.dart';

part 'cart_data.dart';

abstract class CartCard {
  static bool _isVisible = false;
  static Future<void> show({
    required BuildContext context,
    required Category category,
    required List<Game> games,
  }) async {
    if (_isVisible) return;
    _isVisible = true;

    await showAppDialog(
      context: context,
      child: _CartCard(category, games),
    );

    _isVisible = false;
  }
}

class _CartCard extends StatelessWidget {
  final Category category;
  final List<Game> games;

  const _CartCard(this.category, this.games);

  @override
  Widget build(BuildContext context) {
    var categoryGames = SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
      physics: const BouncingScrollPhysics(),
      child: ResponsiveLayoutBuilder(
        small: (_, __) => Column(
          children: games
              .map<Widget>((game) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: _GameItem(game),
                  ))
              .toList(),
        ),
        medium: (_, Widget? child) => child!,
        large: (_, Widget? child) => child!,
        child: (_) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: games
              .map<Widget>((game) => Expanded(child: _GameItem(game)))
              .toList(),
        ),
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 2.0,
          color: Colors.white,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Mpango: ${category.title!.toUpperCase()}',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          categoryGames.expanded(),
        ],
      ),
    );
  }
}

class _GameItem extends StatelessWidget {
  final Game game;
  const _GameItem(this.game);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: game.showIcon
        //       ? StylizedIcon(icon: _infopair.titleIcon)
        //       : StylizedText(text: _infopair.titleText, fontSize: 24.0),
        // ),
        Image.asset(game.image!, height: 200, width: 200),
        Expanded(
          flex: 2,
          child: Text(
            game.title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShortcutColumn extends StatelessWidget {
  final CartData infoData;
  const _ShortcutColumn(this.infoData);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ShortcutScreenHeader(infoData.title),
        const Gap(28),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: infoData.infoPairs
              .map<Widget>((d) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _ShortcutListTile(d),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _ShortcutScreenHeader extends StatelessWidget {
  final String _header;
  const _ShortcutScreenHeader(this._header);

  @override
  Widget build(BuildContext context) {
    return StylizedText(
      text: _header,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 28.0,
        color: Colors.white,
        letterSpacing: 1.4,
      ),
    );
  }
}

class _ShortcutListTile extends StatelessWidget {
  final CartPair _infopair;
  const _ShortcutListTile(this._infopair);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _infopair.showIcon
              ? StylizedIcon(icon: _infopair.titleIcon)
              : StylizedText(text: _infopair.titleText, fontSize: 24.0),
        ),
        Expanded(
          flex: 2,
          child: Text(
            _infopair.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
      ],
    );
  }
}

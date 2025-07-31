import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/helpers/modal_helpers.dart';
import '../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../core/l10n/l10n.dart';
import '../../../data/models/category.dart';
import '../../../data/models/game.dart';

part 'selection_data.dart';

abstract class SelectionCard {
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
      barrierLabel: "aaaa",
      child: _SelectionCard(games),
    );

    _isVisible = false;
  }
}

class _SelectionCard extends StatelessWidget {
  final List<Game> _games;

  const _SelectionCard(this._games);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = _games
        .map<Widget>((g) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: _GameListTile(g),
            ))
        .toList();

    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 2.0,
          color: Colors.blue,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
        physics: const BouncingScrollPhysics(),
        child: ResponsiveLayoutBuilder(
          small: (_, __) => Column(
            children: widgets,
          ),
          medium: (_, Widget? child) => child!,
          large: (_, Widget? child) => child!,
          child: (_) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgets,
          ),
        ),
      ),
    );
  }
}

class _GameListTile extends StatelessWidget {
  final Game _game;
  const _GameListTile(this._game);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        _game.image!,
        height: 50,
        width: 100,
      ),
      title: Text(
        _game.title!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}

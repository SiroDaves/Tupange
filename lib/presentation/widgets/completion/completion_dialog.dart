import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../layout/responsive_layout_builder.dart';
import '../stylized_icon.dart';
import 'completion_dialog_large.dart';
import 'completion_dialog_small.dart';

class CompletionDialog extends StatelessWidget {
  CompletionDialog({Key? key}) : super(key: key);

  final globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            width: 2.0,
            color: Colors.amber,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: ResponsiveLayoutBuilder(
            small: (_, __) => CompletionDialogSmall(
              key: const Key('CompletionDialogSmall'),
              globalKey: globalKey,
            ),
            medium: (_, Widget? child) => child!,
            large: (_, Widget? child) => child!,
            child: (_) => CompletionDialogLarge(
              key: const Key('CompletionDialogLarge'),
              globalKey: globalKey,
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const ScoreTile({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // icon
        Expanded(
          child: Icon(
            icon,
            size: 24.0,
            color: Colors.white,
          ),
        ),

        // text
        Expanded(
          flex: 4,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class WinStarWidget extends StatelessWidget {
  static const maxStar = 5;
  final int star;

  const WinStarWidget({Key? key, this.star = 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(maxStar, (index) {
        return StylizedIcon(
          size: 32.0,
          icon: FontAwesomeIcons.star,
          color: index >= star ? Colors.white.withOpacity(0.20) : Colors.white,
        );
      }).toList(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../layout/responsive_layout_builder.dart';
import '../stylized_button.dart';
import '../stylized_container.dart';
import '../stylized_icon.dart';

class ScrollButtons extends StatelessWidget {
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const ScrollButtons({
    Key? key,
    this.onNext,
    this.onPrevious,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // previous button
        ResponsiveLayoutBuilder(
          small: (_, Widget? child) => child!,
          medium: (_, Widget? child) => child!,
          large: (_, __) => const SizedBox.shrink(),
          child: (layoutSize) {
            final isSmall = layoutSize == ResponsiveLayoutSize.small;

            return StylizedButton(
              onPressed: onPrevious,
              child: StylizedContainer(
                color: Colors.greenAccent,
                child: StylizedIcon(
                  icon: FontAwesomeIcons.chevronLeft,
                  size: isSmall ? 20.0 : 24.0,
                ),
              ),
            );
          },
        ),

        // next button
        ResponsiveLayoutBuilder(
          small: (_, Widget? child) => child!,
          medium: (_, Widget? child) => child!,
          large: (_, __) => const SizedBox.shrink(),
          child: (layoutSize) {
            final isSmall = layoutSize == ResponsiveLayoutSize.small;

            return StylizedButton(
              onPressed: onNext,
              child: StylizedContainer(
                color: Colors.greenAccent,
                child: StylizedIcon(
                  icon: FontAwesomeIcons.chevronRight,
                  size: isSmall ? 20.0 : 24.0,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

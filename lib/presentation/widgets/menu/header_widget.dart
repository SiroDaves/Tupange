import 'package:flutter/material.dart';
import '../../../data/models/puzzle.dart';
import '../../../core/utils/app_localizationsx.dart';
import '../layout/responsive_layout_builder.dart';
import '../stylized_button.dart';
import '../stylized_container.dart';
import '../stylized_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // header title
        ResponsiveLayoutBuilder(
          small: (_, Widget? child) => child!,
          medium: (_, Widget? child) => child!,
          large: (_, Widget? child) => child!,
          child: (layoutSize) {
            final bool isSmall = layoutSize == ResponsiveLayoutSize.small;

            return Text(
              context.l10n!.menuHeading.toUpperCase(),
              key: const Key('initializing'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmall ? 24.0 : 32.0,
                letterSpacing: 1.4,
              ),
            );
          },
        ),
      ],
    );
  }
}

class SegmentedControl extends StatelessWidget {
  final PuzzleLevel groupValue;
  final Map<PuzzleLevel, String> children;
  final ValueChanged<PuzzleLevel> onValueChanged;

  const SegmentedControl({
    Key? key,
    required this.groupValue,
    required this.children,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, Widget? child) => SizedBox(
        width: 350.0,
        child: child!,
      ),
      medium: (_, Widget? child) => SizedBox(
        width: 400.0,
        child: child!,
      ),
      large: (_, Widget? child) => SizedBox(
        width: 400.0,
        child: child!,
      ),
      child: (layoutSize) {
        final isSmall = layoutSize == ResponsiveLayoutSize.small;

        return Row(
          key: isSmall
              ? const Key('segmented_control_small')
              : const Key('segmented_control_normal'),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: children.entries.map<Widget>(
            (value) {
              final isSelected = groupValue == value.key;

              return StylizedButton(
                onPressed: () {
                  onValueChanged(value.key);
                },
                child: StylizedContainer(
                  color: isSelected ? Colors.blueAccent : Colors.grey,
                  child: StylizedText(
                    strokeWidth: 4.0,
                    offset: 1.0,
                    text: value.value,
                    fontSize: isSmall ? 15.0 : 18.0,
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

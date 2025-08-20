import 'package:flutter/material.dart';

import '../../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../../data/models/puzzle.dart';
import '../../../widgets/controls/audio_control.dart';
import '../../../widgets/general/stylized_button.dart';
import '../../../widgets/general/stylized_container.dart';
import '../../../widgets/general/stylized_text.dart';

class SegmentedControl extends StatelessWidget {
  final PuzzleLevel groupValue;
  final Map<PuzzleLevel, String> children;
  final ValueChanged<PuzzleLevel> onValueChanged;

  const SegmentedControl({
    super.key,
    required this.groupValue,
    required this.children,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (_, Widget? child) => SizedBox(
        width: 350.0,
        child: child!,
      ),
      medium: (_, Widget? child) => SizedBox(
        width: 500.0,
        child: child!,
      ),
      large: (_, Widget? child) => SizedBox(
        width: 700.0,
        child: child!,
      ),
      child: (layoutSize) {
        final isSmall = layoutSize == ResponsiveLayoutSize.small;
        List<Widget> widgets = children.entries.map<Widget>(
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
        ).toList();

        widgets.add(
          ResponsiveLayoutBuilder(
            small: (_, __) => const SizedBox.shrink(),
            medium: (_, __) => const SizedBox.shrink(),
            large: (_, __) => AudioControl(),
          ),
        );

        return Row(
          key: isSmall
              ? const Key('segmented_control_small')
              : const Key('segmented_control_normal'),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        );
      },
    );
  }
}

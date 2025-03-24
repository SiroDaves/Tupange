import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tupange/core/l10n/l10n.dart';

import '../../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../data/models/puzzle.dart';
import '../../../cubits/dashboard/level_selection/level_selection_cubit.dart';
import '../../../widgets/controls/audio_control.dart';
import '../../../widgets/stylized_button.dart';
import '../../../widgets/stylized_container.dart';
import '../../../widgets/stylized_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  Map<PuzzleLevel, String> _getLevelWidgets(BuildContext context) {
    final map = {
      PuzzleLevel.easy: context.l10n.easy,
      PuzzleLevel.medium: context.l10n.medium,
    };

    /// add hard level, only for non optimized puzzle
    if (!AppUtils.isOptimizedPuzzle()) {
      map[PuzzleLevel.hard] = context.l10n.hard;
    }

    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AppConstants.kFOTopCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // header title
          ResponsiveLayoutBuilder(
            small: (_, Widget? child) => child!,
            medium: (_, Widget? child) => child!,
            large: (_, Widget? child) => child!,
            child: (layoutSize) {
              final bool isSmall = layoutSize == ResponsiveLayoutSize.small;

              return StylizedContainer(
                key: isSmall
                    ? const Key('header_widget_small')
                    : const Key('header_widget_normal'),
                color: const Color(0xffffcc33),
                child: StylizedText(
                  text: context.l10n.dashboardHeading,
                  fontSize: isSmall ? 24.0 : 32.0,
                  strokeWidth: isSmall ? 5.0 : 6.0,
                ),
              );
            },
          ),

          // gap
          const Gap(32.0),

          // level selection
          BlocBuilder<LevelSelectionCubit, LevelSelectionState>(
            builder: (context, state) {
              return Semantics(
                label: context.l10n.levelSelectionLabel,
                child: _SegmentedControl(
                  groupValue: state.level,
                  children: _getLevelWidgets(context),
                  onValueChanged:
                      context.read<LevelSelectionCubit>().onNewLevelSelected,
                ),
              );
            },
          ),

          // gap
          const Gap(32),

          // music control for medium & small screens
          ResponsiveLayoutBuilder(
            small: (_, Widget? child) => child!,
            medium: (_, Widget? child) => child!,
            large: (_, __) => const SizedBox.shrink(),
            child: (_) => const AudioControl(),
          ),
        ],
      ),
    );
  }
}

class _SegmentedControl extends StatelessWidget {
  final PuzzleLevel groupValue;
  final Map<PuzzleLevel, String> children;
  final ValueChanged<PuzzleLevel> onValueChanged;

  const _SegmentedControl({
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

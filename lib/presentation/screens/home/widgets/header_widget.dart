import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tupange/core/l10n/l10n.dart';

import '../../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../data/models/puzzle.dart';
import '../../../cubits/level/level_selection_cubit.dart';
import '../../../widgets/controls/audio_control.dart';
import '../../../widgets/general/stylized_container.dart';
import '../../../widgets/general/stylized_text.dart';
import 'segmented_control.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  Map<PuzzleLevel, String> _getLevelWidgets(BuildContext context) {
    final map = {
      PuzzleLevel.easy: context.l10n.easy,
      PuzzleLevel.medium: context.l10n.medium,
    };

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

          const Gap(32.0),

          BlocBuilder<LevelSelectionCubit, LevelSelectionState>(
            builder: (context, state) {
              return Semantics(
                label: context.l10n.levelSelectionLabel,
                child: SegmentedControl(
                  groupValue: state.level,
                  children: _getLevelWidgets(context),
                  onValueChanged:
                      context.read<LevelSelectionCubit>().onNewLevelSelected,
                ),
              );
            },
          ),

          const Gap(32),

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

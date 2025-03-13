import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../blocs/menu/menu_bloc.dart';
import '../../cubits/menu/game_selection_cubit.dart';
import '../../cubits/menu/category_selection_cubit.dart';
import '../../cubits/menu/level_selection_cubit.dart';
import '../../../data/models/puzzle.dart';
import '../../../common/utils/constants/app_constants.dart';
import '../../widgets/controls/audio_control.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/utils/app_localizationsx.dart';
import '../../../common/utils/constants/app_dimens.dart';
import '../../../common/utils/utils.dart';
import '../../widgets/info_card/info_card.dart';
import '../../widgets/layout/responsive_layout_builder.dart';
import '../../widgets/menu/header_widget.dart';
import '../../widgets/stylized_button.dart';
import '../../widgets/stylized_container.dart';
import '../../widgets/stylized_icon.dart';
import '../../widgets/stylized_text.dart';
import 'menu_selection.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (c) => MenuBloc()..add(MenuInitialized(size)),
        ),
        BlocProvider(create: (_) => LevelSelectionCubit()),
        BlocProvider(create: (_) => CategorySelectionCubit()),
        BlocProvider(
          create: (c) => GameSelectionCubit(
            c.read<LevelSelectionCubit>(),
            c.read<CategorySelectionCubit>(),
            context,
          ),
        ),
      ],
      child: const MenuView(),
    );
  }
}

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => MenuViewState();
}

class MenuViewState extends State<MenuView>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  Size get size => MediaQuery.of(context).size;
  bool isLarge = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final s = size;
    if (s.width > AppDimens.medium) {
      context.read<MenuBloc>().add(MenuResized(s));
    }
  }

  Map<PuzzleLevel, String> getLevelWidgets(BuildContext context) {
    final map = {
      PuzzleLevel.easy: context.l10n!.easy,
      PuzzleLevel.medium: context.l10n!.medium,
    };

    /// add hard level, only for non optimized puzzle
    if (!Utils.isOptimizedPuzzle()) {
      map[PuzzleLevel.hard] = context.l10n!.hard;
    }

    return map;
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((MenuBloc bloc) => bloc.state);

    if (state is MenuLoading) {
      return const SizedBox.shrink();
    }
    state as MenuReady;

    var appBar = AppBar(
      title: StylizedText(
        text: AppConstants.appTitle.toUpperCase(),
        strokeWidth: 2.0,
        style: const TextStyle(
          color: Colors.white,
          letterSpacing: 10,
          fontWeight: FontWeight.bold,
        ),
        textColor: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: const [
        AudioControl(),
      ],
    );
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.nairobiImg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SizedBox.fromSize(
            size: size,
            child: Column(
              children: [
                appBar,
                const Gap(32),
                const HeaderWidget(),
                const Gap(32),
                Expanded(
                  child: ResponsiveLayoutBuilder(
                    small: (_, Widget? child) => MenuScreenSmall(child: child!),
                    medium: (_, Widget? child) =>
                        MenuScreenMedium(child: child!),
                    large: (_, Widget? child) => child!,
                    child: (_) => MenuScreenLarge(state: state),
                  ),
                ),
                const Gap(32),
                BlocBuilder<LevelSelectionCubit, LevelSelectionState>(
                  builder: (context, state) {
                    return Semantics(
                      label: context.l10n!.levelSelectionLabel,
                      child: SegmentedControl(
                        groupValue: state.level,
                        children: getLevelWidgets(context),
                        onValueChanged: context
                            .read<LevelSelectionCubit>()
                            .onNewLevelSelected,
                      ),
                    );
                  },
                ),
                const Gap(32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StylizedButton(
      onPressed: () {
        InfoCard.show(context: context);
      },
      child: const StylizedContainer(
        padding: EdgeInsets.all(12.0),
        color: Colors.greenAccent,
        child: StylizedIcon(
          icon: FontAwesomeIcons.info,
          size: 15.0,
          offset: 1.0,
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}

class AnimationToggleButton extends StatelessWidget {
  const AnimationToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StylizedButton(
      onPressed: () {},
      child: const StylizedContainer(
        //color: isPaused ? Colors.grey : Colors.blueAccent,
        padding: EdgeInsets.all(12.0),
        child: StylizedIcon(
          //icon: isPaused ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
          icon: FontAwesomeIcons.play,
          size: 15.0,
          offset: 1.0,
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}

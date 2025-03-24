import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/audio/cubit/audio_player_cubit.dart';
import '../../../core/layout/utils/app_breakpoints.dart';
import '../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../blocs/home/home_bloc.dart';
import '../../cubits/dashboard/level_selection/level_selection_cubit.dart';
import '../../cubits/dashboard/planet_orbital/planet_orbital_animation_cubit.dart';
import '../../cubits/dashboard/planet_selection/planet_selection_cubit.dart';
import '../../cubits/dashboard/planet_selection/planet_selection_helper_cubit.dart';
import '../../widgets/background/background.dart';
import '../../widgets/controls/audio_control.dart';
import '../../widgets/keyboard_handlers/dashboard_keyboard_handler.dart';
import 'views/home_views.dart';
import 'widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PlanetOrbitalAnimationCubit(size)),
        BlocProvider(
          create: (c) => HomeBloc(c.read<PlanetOrbitalAnimationCubit>())
            ..add(HomeInitialized(size)),
        ),
        BlocProvider(create: (_) => LevelSelectionCubit()),
        BlocProvider(
          create: (c) => PlanetSelectionCubit(
            c.read<LevelSelectionCubit>(),
            context,
          ),
        ),
        BlocProvider(
          create: (c) => PlanetSelectionHelperCubit(
            planetAnimationCubit: c.read<PlanetOrbitalAnimationCubit>(),
          ),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  Size get size => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<PlanetOrbitalAnimationCubit>().setTickerProvider(this);
    context.read<AudioPlayerCubit>().playThemeMusic();
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
    if (s.width > AppBreakpoints.medium) {
      context.read<HomeBloc>().add(HomeResized(s));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((HomeBloc bloc) => bloc.state);

    if (state is HomeLoading) {
      return const SizedBox.shrink();
    }

    return HomeKeyboardHandler(
      orbits: (state as HomeReady).orbits,
      child: Background(
        child: SizedBox.fromSize(
          size: size,
          child: Stack(
            children: [
              ResponsiveLayoutBuilder(
                small: (_, Widget? child) => HomePageSmall(child: child!),
                medium: (_, Widget? child) =>
                    HomePageMedium(child: child!),
                large: (_, Widget? child) => child!,
                child: (_) => HomePageLarge(state: state),
              ),
              const HeaderWidget(),

              ResponsiveLayoutBuilder(
                small: (_, __) => const SizedBox.shrink(),
                medium: (_, __) => const SizedBox.shrink(),
                large: (_, __) => const Align(
                  alignment: AppConstants.kFOTopRight,
                  child: AudioControl(),
                ),
              ),

              const Align(
                alignment: AppConstants.kFOBottomRight,
                child: PlanetAnimationToggleButton(),
              ),
              ResponsiveLayoutBuilder(
                small: (_, __) => const Align(
                  alignment: AppConstants.kFOBottomLeft,
                  child: InfoButton(),
                ),
                medium: (_, __) => const Align(
                  alignment: AppConstants.kFOTopLeft,
                  child: InfoButton(),
                ),
                large: (_, __) => const Align(
                  alignment: AppConstants.kFOTopLeft,
                  child: InfoButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

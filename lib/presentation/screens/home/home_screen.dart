import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/audio/audio_player_cubit.dart';
import '../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../../data/models/category.dart';
import '../../../data/models/game.dart';
import '../../blocs/home/home_bloc.dart';
import '../../cubits/level_selection/level_selection_cubit.dart';
import '../../cubits/planet_orbital/planet_orbital_animation_cubit.dart';
import '../../cubits/planet_selection/planet_selection_cubit.dart';
import '../../cubits/planet_selection/planet_selection_helper_cubit.dart';
import '../../widgets/controls/audio_control.dart';
import '../../widgets/progress/custom_snackbar.dart';
import '../../widgets/progress/general_progress.dart';
import '../../widgets/stylized_button.dart';
import '../../widgets/stylized_container.dart';
import '../../widgets/stylized_icon.dart';
import 'widgets/header_widget.dart';
import 'widgets/info_widget.dart';
import 'widgets/menu_carousel.dart';

part 'home_views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (c) => HomeBloc()..add(FetchData()),
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
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.nairobiImg),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(top: 10),
          child: HomeView(),
        ),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  Size get size => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    context.read<AudioPlayerCubit>().playThemeMusic();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeFailureState) {
          CustomSnackbar.show(context, state.feedback);
        }
      },
      builder: (context, state) {
        return SizedBox.fromSize(
          size: size,
          child: state.maybeWhen(
            orElse: () => const SizedBox(),
            failure: (feedback) => EmptyState(
              //title: l10n.habitChooserFailure,
              showRetry: true,
              //onRetry: () => bloc.add(const FetchData()),
            ),
            loading: () => LoadingProgress(),
            fetched: (categories, games) => Stack(
              children: [
                ResponsiveLayoutBuilder(
                  small: (_, Widget? child) => HomeSmall(child: child!),
                  medium: (_, Widget? child) => HomeMedium(child: child!),
                  large: (_, Widget? child) => child!,
                  child: (_) => HomeDetails(
                    categories: categories,
                    games: games,
                  ),
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
                /*const Align(
            alignment: AppConstants.kFOBottomRight,
            child: PlanetAnimationToggleButton(),
          ),*/
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
        );
      },
    );
  }
}

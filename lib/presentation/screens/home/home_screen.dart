import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/audio/cubit/audio_player_cubit.dart';
import '../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../core/resource/app_assets.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../../data/models/category.dart';
import '../../../data/models/game.dart';
import '../../blocs/home/home_bloc.dart';
import '../../cubits/dashboard/level_selection/level_selection_cubit.dart';
import '../../cubits/dashboard/planet_orbital/planet_orbital_animation_cubit.dart';
import '../../cubits/dashboard/planet_selection/planet_selection_cubit.dart';
import '../../cubits/dashboard/planet_selection/planet_selection_helper_cubit.dart';
import '../../widgets/controls/audio_control.dart';
import '../../widgets/stylized_button.dart';
import '../../widgets/stylized_container.dart';
import '../../widgets/stylized_icon.dart';
import 'widgets/header_widget.dart';
import 'widgets/info_widget.dart';
import 'widgets/menu_carousel.dart';

part  'views/home_details.dart';
part  'views/home_views.dart';

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

    return SizedBox.fromSize(
      size: size,
      child: Stack(
        children: [
          ResponsiveLayoutBuilder(
            small: (_, Widget? child) => HomeSmall(child: child!),
            medium: (_, Widget? child) => HomeMedium(child: child!),
            large: (_, Widget? child) => child!,
            child: (_) => HomeDetails(),
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
    );
  }
}

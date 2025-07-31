import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/layout/utils/responsive_layout_builder.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../../data/models/category.dart';
import '../../../data/models/game.dart';
import '../../blocs/home/home_bloc.dart';
import '../../cubits/audio/audio_player_cubit.dart';
import '../../cubits/level_selection/level_selection_cubit.dart';
import '../../cubits/game_selection/game_selection_cubit.dart';
import '../../widgets/controls/audio_control.dart';
import '../../widgets/progress/custom_snackbar.dart';
import '../../widgets/progress/general_progress.dart';
import '../../widgets/selection/selection_card.dart';
import 'widgets/header_widget.dart';
import 'widgets/menu_carousel.dart';

part 'home_view.dart';
part 'home_details.dart';

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
          create: (ctx) => GameSelectionCubit(
            ctx.read<LevelSelectionCubit>(),
            context,
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
          padding: EdgeInsets.only(top: 30),
          child: HomeView(),
        ),
      ),
    );
  }
}

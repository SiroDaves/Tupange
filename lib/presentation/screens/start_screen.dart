import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../cubits/audio/audio_player_cubit.dart';
import '../../core/utils/app_localizationsx.dart';
import '../../core/utils/constants/app_constants.dart';
import '../../core/utils/constants/app_assets.dart';
import '../../core/utils/constants/app_dimens.dart';
import '../../core/utils/utils.dart';
import '../widgets/layout/responsive_layout_builder.dart';
import '../widgets/loading.dart';
import '../widgets/stylized_button.dart';
import '../widgets/stylized_container.dart';
import '../widgets/stylized_text.dart';
import 'menu/menu_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void nextAction(BuildContext context) async {
    context.read<AudioPlayerCubit>().playThemeMusic();

    final page = await Utils.buildPageAsync(const MenuScreen());

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: AppDimens.kMS800,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioPlayerCubit, AudioPlayerState>(
      listener: (context, state) {
        final bool isReady = state is AudioPlayerReady;
      },
      builder: (context, state) {
        final bool isReady = state is AudioPlayerReady;
        var mainContent = Padding(
          padding: const EdgeInsets.all(12.0),
          child: ResponsiveLayoutBuilder(
            small: (_, __) => StartScreenSmall(
              isInitialized: true,
              isReady: isReady,
              onStartPressed: () => nextAction(context),
            ),
            medium: (_, Widget? child) => child!,
            large: (_, Widget? child) => child!,
            child: (_) => StartScreenLarge(
              isInitialized: true,
              isReady: isReady,
              onStartPressed: () => nextAction(context),
            ),
          ),
        );

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(AppAssets.nairobiImg),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: SafeArea(
              child: mainContent,
            ),
          ),
        );
      },
    );
  }
}

class StartScreenLarge extends StatelessWidget {
  final bool isReady;
  final bool isInitialized;
  final VoidCallback onStartPressed;

  const StartScreenLarge({
    Key? key,
    required this.isReady,
    required this.isInitialized,
    required this.onStartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(AppAssets.appIcon),
        ),
        Expanded(
          child: MainBody(
            isLarge: true,
            isInitialized: isInitialized,
            isReady: isReady,
            onPressed: onStartPressed,
          ),
        ),
      ],
    );
  }
}

class StartScreenSmall extends StatelessWidget {
  final bool isReady;
  final bool isInitialized;
  final VoidCallback onStartPressed;

  const StartScreenSmall({
    super.key,
    required this.isReady,
    required this.isInitialized,
    required this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // show asset
          Expanded(
            flex: 5,
            child: Image.asset(AppAssets.appIcon),
          ),

          // show rest body
          Expanded(
            flex: 7,
            child: MainBody(
              isInitialized: isInitialized,
              isReady: isReady,
              onPressed: onStartPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  final bool isReady;
  final bool isInitialized;
  final bool isLarge;
  final VoidCallback onPressed;

  const MainBody({
    super.key,
    this.isLarge = false,
    required this.isInitialized,
    required this.isReady,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            StylizedText(
              text: AppConstants.appTitle,
              fontSize: isLarge ? 68.0 : 48.0,
              style: TextStyle(
                color: Colors.white,
                fontSize: isLarge ? 68.0 : 48.0,
                letterSpacing: 10,
                fontWeight: FontWeight.bold,
              ),
              textColor: Colors.white,
            ),
            // loading animation
            AnimatedSwitcher(
              duration: AppDimens.kMS300,
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: !isInitialized
                  ? Text(
                      context.l10n!.loadingScreenInitializing.toUpperCase(),
                      key: const Key('initializing'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Utils.darkenColor(Colors.green.shade100),
                        fontSize: isLarge ? 28.0 : 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                      ),
                    )
                  : Text(
                      context.l10n!.loadingScreenReady.toUpperCase(),
                      key: const Key('ready'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Utils.darkenColor(Colors.green.shade100),
                        fontSize: isLarge ? 28.0 : 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                      ),
                    ),
            ),

            const Gap(28.0),

            // loading animation
            AnimatedOpacity(
              duration: AppDimens.kMS300,
              opacity: isReady ? 1.0 : 0.0,
              child: Loading(
                key: ValueKey(isReady),
                tileSize: isLarge ? 80.0 : 50.0,
              ),
            ),
          ],
        ),

        // start button
        StylizedButton(
          onPressed: () {
            if (isReady && isInitialized) {
              onPressed();
            }
          },
          child: StylizedContainer(
            color: isReady && isInitialized ? Colors.greenAccent : Colors.grey,
            child: StylizedText(
              text: context.l10n!.start,
              fontSize: isLarge ? 32.0 : 24.0,
            ),
          ),
        ),
      ],
    );
  }
}

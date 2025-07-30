import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/audio/audio_player_cubit.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../cubits/loading/assetcache_cubit.dart';
import '../../navigator/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late final AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);
    _playIntroMusic();
  }

  Future<void> _playIntroMusic() async {
    await player.setSource(AssetSource(AppAssets.introMusic));
    await player.resume();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void nextScreen() async {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.home,
        (route) => false,
      );
    }

    return BlocConsumer<AudioPlayerCubit, AudioPlayerState>(
      listener: (context, state) {
        if (state is AudioPlayerReady) {
          context.read<AssetcacheCubit>().startCache(context);
          nextScreen();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Image.asset(AppAssets.appIcon, height: 200, width: 200),
                const SizedBox(height: 10),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      AppConstants.appTitle,
                      textStyle: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontSize: 36, fontWeight: FontWeight.bold),
                      speed: const Duration(milliseconds: 110),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 0),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                const Spacer(),
                const Text(
                  '© Siro Daves',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        );
      },
    );
  }
}

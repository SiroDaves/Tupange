import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/app_logger.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_dimens.dart';
import '../../../core/utils/helpers/audio_player.dart';
import '../../blocs/audio/audio_control_bloc.dart';

part 'audio_player_state.dart';

const maxThemeVolume = 0.30;
const clickVolume = 0.80;
const visibilityVolume = 0.30;
const countDownVolume = 0.30;
const tapVolume = 0.40;
const completionVolume = 0.70;

// max size allowed is 5x5
const maxTiles = 25;

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioControlBloc audioBloc;

  // audio players
  // theme music player
  final bgMusicSource = AssetSource(AppAssets.themeMusic1);
  final AudioPlayer bgMusicPlayer = getAudioPlayer();

  // button click player
  final btnClickSource = AssetSource(AppAssets.buttonClick);
  final AudioPlayer btnClickPlayer = getAudioPlayer();

  // visibility player
  final visibilitySource = AssetSource(AppAssets.visibility);
  final AudioPlayer visibilityPlayer = getAudioPlayer();

  // count down begin player
  final countDownBeginSource = AssetSource(AppAssets.countDownBegin);
  final AudioPlayer countDownBeginPlayer = getAudioPlayer();

  // completion player
  final completionSource = AssetSource(AppAssets.completion);
  final AudioPlayer completionPlayer = getAudioPlayer();

  final tileTapSucessSource = AssetSource(AppAssets.tileTapSuccess);
  final tileTapErrorSource = AssetSource(AppAssets.tileTapError);

  // tile tap player
  final Map<int, AudioPlayer> tileTapSuccessPlayer = {};
  final Map<int, AudioPlayer> tileTapErrorPlayer = {};
  // final AudioPlayer tileTapPlayerSuccess = getAudioPlayer();
  // final AudioPlayer tileTapPlayerError = getAudioPlayer();

  Timer? audioTimer;

  AudioPlayerCubit(this.audioBloc) : super(const AudioPlayerLoading()) {
    init();
  }

  void init() {
    // do audio initializations after showing loading screen
    // to avoid freeze screen
    audioTimer = Timer(AppDimens.kMS200, () async {
      // theme music setup
      await bgMusicPlayer.setSource(bgMusicSource);
      await bgMusicPlayer.setReleaseMode(ReleaseMode.loop);
      await bgMusicPlayer.setVolume(maxThemeVolume);

      // after the large part of audio is loaded, we can emit audio player ready,
      // the web app won't freeze the UI anymore - for these small audio files
      emit(const AudioPlayerReady());

      // button click
      await btnClickPlayer.setSource(btnClickSource);
      await btnClickPlayer.setVolume(clickVolume);

      // visibility click
      await visibilityPlayer.setSource(visibilitySource);
      await visibilityPlayer.setVolume(visibilityVolume);

      // count down begin
      await countDownBeginPlayer.setSource(countDownBeginSource);
      await countDownBeginPlayer.setVolume(countDownVolume);

      // completion
      await completionPlayer.setSource(completionSource);
      await completionPlayer.setVolume(completionVolume);

      // tile tap
      for (int i = 0; i < maxTiles; i++) {
        // tile tap success
        final tileTapSuccess = getAudioPlayer();
        await tileTapSuccess.setSource(tileTapSucessSource);
        await tileTapSuccess.setVolume(tapVolume);
        tileTapSuccessPlayer[i] = tileTapSuccess;

        // tile tap error
        final tileTapError = getAudioPlayer();
        await tileTapError.setSource(tileTapErrorSource);
        await tileTapError.setVolume(tapVolume);
        tileTapErrorPlayer[i] = tileTapError;
      }
    });

    audioBloc.stream.listen(onAudioControlStateChanged);
  }

  void onBackToMenu() {
    // stop count down sound effect
    countDownBeginPlayer.stop();

    // visibility sound effect
    visibilityPlayer.stop();
  }

  void playThemeMusic() {
    unawaited(bgMusicPlayer.play(bgMusicSource));
  }

  void onAudioControlStateChanged(AudioControlState audioControlState) {
    // sound effect related settings
    // count down sound effect
    if (audioControlState.isSoundEffectEnabled) {
      countDownBeginPlayer.setVolume(countDownVolume);
    } else {
      countDownBeginPlayer.setVolume(0.0);
    }

    // music related settings
    // app theme music
    if (audioControlState.isMusicEnabled) {
      bgMusicPlayer.setVolume(maxThemeVolume);
    } else {
      bgMusicPlayer.setVolume(0.0);
    }
  }

  @override
  Future<void> close() {
    audioTimer?.cancel();
    bgMusicPlayer.dispose();
    btnClickPlayer.dispose();
    tileTapSuccessPlayer.forEach((_, audioPlayer) => audioPlayer.dispose());
    tileTapErrorPlayer.forEach((_, audioPlayer) => audioPlayer.dispose());
    return super.close();
  }

  bool get isSoundEffectEnabled => audioBloc.state.isSoundEffectEnabled;

  // public methods

  void tileTappedAudio(int tileValue, {isError = false}) {
    AppLogger.log('AudioPlayerCubit :: tileTappedAudio');
    if (!isSoundEffectEnabled) return;
    if (isError) {
      unawaited(tileTapErrorPlayer[tileValue]!.replay(tileTapErrorSource));
    } else {
      unawaited(tileTapSuccessPlayer[tileValue]!.replay(tileTapSucessSource));
    }
  }

  void buttonClickAudio() {
    if (isSoundEffectEnabled) unawaited(btnClickPlayer.replay(btnClickSource));
  }

  void beginCountDown() {
    unawaited(countDownBeginPlayer.replay(countDownBeginSource));
  }

  void onVisibilityShown() {
    if (isSoundEffectEnabled) unawaited(visibilityPlayer.replay(visibilitySource));
  }

  void completion() {
    if (isSoundEffectEnabled) unawaited(completionPlayer.replay(completionSource));
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_control_event.dart';
part 'audio_control_state.dart';

class AudioControlBloc extends Bloc<AudioControlEvent, AudioControlState> {
  AudioControlBloc() : super(const AudioControlState()) {
    on<AudioControlMusicToggle>(onMusicToggle);
    on<AudioControlSoundEffectToggle>(onSoundEffectToggle);
  }

  void onMusicToggle(
      AudioControlMusicToggle _, Emitter<AudioControlState> emit) {
    emit(state.copyWith(
      isMusicEnabled: !state.isMusicEnabled,
    ));
  }

  void onSoundEffectToggle(
      AudioControlSoundEffectToggle _, Emitter<AudioControlState> emit) {
    emit(state.copyWith(
      isSoundEffectEnabled: !state.isSoundEffectEnabled,
    ));
  }
}

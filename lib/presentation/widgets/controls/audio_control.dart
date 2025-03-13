import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../blocs/audio/audio_control_bloc.dart';
import '../../cubits/audio/audio_player_cubit.dart';
import '../stylized_icon.dart';

class BackControl extends StatelessWidget {
  final bool isSmall;
  const BackControl({Key? key, this.isSmall = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AudioPlayerCubit>().onBackToMenu();
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.all(isSmall ? 4.0 : 18.0),
        child: StylizedIcon(
          icon: FontAwesomeIcons.chevronLeft,
          size: isSmall ? 18.0 : 24.0,
          offset: isSmall ? 1.0 : 2.0,
          strokeWidth: 3,
        ),
      ),
    );
  }
}

class AudioControl extends StatelessWidget {
  final bool isSmall;
  const AudioControl({Key? key, this.isSmall = false}) : super(key: key);

  void _onMusicToggle(BuildContext context) {
    context.read<AudioControlBloc>().add(const AudioControlMusicToggle());
  }

  void _onSoundEffectToggle(BuildContext context) {
    context.read<AudioControlBloc>().add(const AudioControlSoundEffectToggle());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((AudioControlBloc bloc) => bloc.state);
    final isMusicEnabled = state.isMusicEnabled;
    final isSoundEffectEnabled = state.isSoundEffectEnabled;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => _onMusicToggle(context),
          child: StylizedIcon(
            icon: isMusicEnabled
                ? Icons.music_note_rounded
                : Icons.music_off_rounded,
            size: isSmall ? 18.0 : 24.0,
            offset: isSmall ? 1.0 : 2.0,
            strokeWidth: 3,
          ),
        ),
        isSmall ? const Gap(5.0) : const Gap(10.0),
        InkWell(
          onTap: () => _onSoundEffectToggle(context),
          child: StylizedIcon(
            icon: isSoundEffectEnabled
                ? FontAwesomeIcons.volumeUp
                : FontAwesomeIcons.volumeMute,
            size: isSmall ? 18.0 : 24.0,
            offset: isSmall ? 1.0 : 2.0,
            strokeWidth: 3,
          ),
        ),
        isSmall ? const Gap(5.0) : const Gap(15.0),
      ],
    );
  }
}

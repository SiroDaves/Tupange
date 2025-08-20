import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../blocs/audio/audio_control_bloc.dart';
import '../general/stylized_button.dart';
import '../general/stylized_container.dart';
import '../general/stylized_icon.dart';

class AudioControl extends StatelessWidget {
  final bool isSmall;
  const AudioControl({super.key, this.isSmall = false});

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
        // music button
        StylizedButton(
          onPressed: () => _onMusicToggle(context),
          child: StylizedContainer(
            padding: isSmall
                ? const EdgeInsets.all(8.0)
                : const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 12.0,
                  ),
            color: isMusicEnabled ? Colors.blueAccent : Colors.grey,
            child: StylizedIcon(
              icon: isMusicEnabled
                  ? Icons.music_note_rounded
                  : Icons.music_off_rounded,
              size: 18.0,
              strokeWidth: 4.0,
              offset: 1.0,
            ),
          ),
        ),

        // gap
        isSmall ? const Gap(4.0) : const Gap(18.0),

        StylizedButton(
          onPressed: () => _onSoundEffectToggle(context),
          child: StylizedContainer(
            padding: isSmall
                ? const EdgeInsets.all(8.0)
                : const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 12.0,
                  ),
            color: isSoundEffectEnabled ? Colors.blueAccent : Colors.grey,
            child: StylizedIcon(
              icon: isSoundEffectEnabled
                  ? FontAwesomeIcons.volumeUp
                  : FontAwesomeIcons.volumeMute,
              size: 18.0,
              strokeWidth: 4.0,
              offset: 1.0,
            ),
          ),
        ),

        // isSmall ? const Gap(4.0) : const Gap(18.0),

        // StylizedButton(
        //   onPressed: () => InfoCard.show(context: context),
        //   child: StylizedContainer(
        //     padding: isSmall
        //         ? const EdgeInsets.all(8.0)
        //         : const EdgeInsets.symmetric(
        //             horizontal: 18.0,
        //             vertical: 12.0,
        //           ),
        //     color:  Colors.greenAccent,
        //     child: StylizedIcon(
        //       icon: FontAwesomeIcons.info,
        //       size: 18.0,
        //       strokeWidth: 4.0,
        //       offset: 1.0,
        //     ),
        //   ),
        // ),

      ],
    );
  }
}

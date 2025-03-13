import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/audio/audio_player_cubit.dart';
import '../../common/utils/constants/app_dimens.dart';

class StylizedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  StylizedButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final buttonPressedVn = ValueNotifier<bool>(false);

  void animate() {
    buttonPressedVn.value = true;
  }

  Future<void> reverseAnimate() async {
    await Future.delayed(AppDimens.kMS50);
    buttonPressedVn.value = false;
  }

  void onPressConfirm(BuildContext context) {
    context.read<AudioPlayerCubit>().buttonClickAudio();
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => animate(),
        onTapUp: (_) async {
          await reverseAnimate();
          onPressConfirm(context);
        },
        onTapCancel: reverseAnimate,
        child: ValueListenableBuilder(
          valueListenable: buttonPressedVn,
          child: child,
          builder: (_, bool isPressed, Widget? child) {
            return AnimatedScale(
              scale: isPressed ? 0.90 : 1.0,
              curve: Curves.elasticOut,
              duration: AppDimens.kMS300,
              child: child,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/audio/cubit/audio_player_cubit.dart';
import '../../core/utils/constants/app_constants.dart';

class StylizedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  StylizedButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final _buttonPressedVn = ValueNotifier<bool>(false);

  void _animate() {
    _buttonPressedVn.value = true;
  }

  Future<void> _reverseAnimate() async {
    await Future.delayed(AppConstants.kMS50);
    _buttonPressedVn.value = false;
  }

  void _onPressConfirm(BuildContext context) {
    context.read<AudioPlayerCubit>().buttonClickAudio();
    onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => _animate(),
        onTapUp: (_) async {
          await _reverseAnimate();
          _onPressConfirm(context);
        },
        onTapCancel: _reverseAnimate,
        child: ValueListenableBuilder(
          valueListenable: _buttonPressedVn,
          child: child,
          builder: (_, bool isPressed, Widget? child) {
            return AnimatedScale(
              scale: isPressed ? 0.90 : 1.0,
              curve: Curves.elasticOut,
              duration: AppConstants.kMS300,
              child: child,
            );
          },
        ),
      ),
    );
  }
}

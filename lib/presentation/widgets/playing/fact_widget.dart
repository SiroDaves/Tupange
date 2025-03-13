import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/playing/fact_cubit.dart';
import '../animated_text.dart';

class FactWidget extends StatelessWidget {
  final bool isLarge;
  final bool isSmall;

  const FactWidget({
    Key? key,
    required this.isLarge,
    required this.isSmall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((FactCubit cubit) => cubit.state);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.read<FactCubit>().newFact();
        },
        child: AppAnimatedWidget(
          showOnComplete: true,
          key: ValueKey(state.fact),
          child: Text(
            state.fact,
            textAlign: isLarge ? TextAlign.start : TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isSmall
                  ? 16.0
                  : isLarge
                      ? 24.0
                      : 20.0,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

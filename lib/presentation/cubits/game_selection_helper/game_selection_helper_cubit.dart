import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../planet_orbital/planet_orbital_animation_cubit.dart';

part 'game_selection_helper_state.dart';

class PuzzleSelectionHelperCubit extends Cubit<PuzzleSelectionHelperState> {
  final PlanetOrbitalAnimationCubit animationCubit;

  PuzzleSelectionHelperCubit({
    required this.animationCubit,
  }) : super(const PuzzleSelectionHelperState());

  void onPlanetMovementToggle() {
    final newIsPaused = !state.isPaused;

    // stop / start planet animations
    if (newIsPaused) {
      // stop all animation
      animationCubit.stopAll();
    } else {
      // start all animation
      animationCubit.playAll();
    }

    emit(state.copyWith(isPaused: newIsPaused));
  }
}

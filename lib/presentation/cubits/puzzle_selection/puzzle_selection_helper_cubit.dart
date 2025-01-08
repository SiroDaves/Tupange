import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../planet_orbital/planet_orbital_animation_cubit.dart';

part 'puzzle_selection_helper_state.dart';

class PuzzleSelectionHelperCubit extends Cubit<PuzzleSelectionHelperState> {
  final PlanetOrbitalAnimationCubit planetAnimationCubit;

  PuzzleSelectionHelperCubit({
    required this.planetAnimationCubit,
  }) : super(const PuzzleSelectionHelperState());

  void onPlanetMovementToggle() {
    final newIsPaused = !state.isPaused;

    // stop / start planet animations
    if (newIsPaused) {
      // stop all animation
      planetAnimationCubit.stopAll();
    } else {
      // start all animation
      planetAnimationCubit.playAll();
    }

    emit(state.copyWith(isPaused: newIsPaused));
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'planet_orbital_animation_cubit.dart';

part 'planet_selection_helper_state.dart';

class PlanetSelectionHelperCubit extends Cubit<PlanetSelectionHelperState> {
  final PlanetOrbitalAnimationCubit planetAnimationCubit;

  PlanetSelectionHelperCubit({
    required this.planetAnimationCubit,
  }) : super(const PlanetSelectionHelperState());

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

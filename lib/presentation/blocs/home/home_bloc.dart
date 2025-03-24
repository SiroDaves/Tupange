import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/layout/layout.dart';
import '../../../data/models/coordinate.dart';
import '../../../data/models/orbit.dart';
import '../../../data/models/planet.dart';
import '../../../core/utils/constants/app_constants.dart';
import '../../cubits/dashboard/planet_orbital/planet_orbital_animation_cubit.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PlanetOrbitalAnimationCubit _planetAnimationCubit;

  HomeBloc(this._planetAnimationCubit) : super(HomeLoading()) {
    on<HomeInitialized>(_onHomeInit);
    on<HomeResized>(_onHomeResized);
  }

  PlanetType _getPlanetTypeAt(int index) {
    return PlanetType.values[index];
  }

  double _getPlanetSizeAt(int index, Size size) {
    return size.width * 0.055 * AppConstants.kPlanetSizeFactor[_getPlanetTypeAt(index)]!;
  }

  List<Orbit> _generateOrbits(Size size) {
    const int totalPlanets = AppConstants.kTotalPlanets;
    final firstRadius = size.width * 0.50;
    final steps = (size.width - firstRadius / 2) / (totalPlanets - 1);

    // generate the orbits and planets
    return List.generate(
      totalPlanets,
      (i) {
        final r1 = firstRadius + (steps * i * 1.9);
        final r2 = (firstRadius + (steps * i * 1.9)) + (i * i * 1.01);

        final planetSize = _getPlanetSizeAt(i, size);

        return Orbit(
          planet: Planet(
            key: i,
            type: _getPlanetTypeAt(i),
            parentSize: size,
            planetSize: planetSize,
            origin: Coordinate(x: 0, y: size.height / 2),
            r1: r1 / 2,
            r2: r2 / 2,
          ),
          origin: Coordinate(x: -r1 / 2, y: size.height / 2 - (r2 / 2)),
          r1: r1,
          r2: r2,
          orbitWidth: (i > totalPlanets ~/ 2) ? 2.0 : 2.5,
        );
      },
    );
  }

  void _onHomeResized(
    HomeResized event,
    Emitter<HomeState> emit,
  ) {
    // generate new orbits
    final orbits = _generateOrbits(event.size);

    emit(HomeReady(orbits));
  }

  void _onHomeInit(
    HomeInitialized event,
    Emitter<HomeState> emit,
  ) {
    Size size = event.size;

    if (event.size.width < AppBreakpoints.medium) {
      size = Size(AppBreakpoints.medium, event.size.height);
    }

    // generate orbits
    final orbits = _generateOrbits(size);

    // init the animations for planets
    _planetAnimationCubit.initAnimators(orbits);

    emit(HomeReady(orbits));
  }
}

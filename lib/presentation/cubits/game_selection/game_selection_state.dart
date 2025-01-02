part of 'game_selection_cubit.dart';

abstract class GameSelectionState extends Equatable {
  const GameSelectionState();

  @override
  List<Object> get props => [];
}

class NoPlanetSelected extends GameSelectionState {}

class PlanetSelected extends GameSelectionState {
  final Planet planet;

  const PlanetSelected({required this.planet});

  @override
  List<Object> get props => [planet];
}

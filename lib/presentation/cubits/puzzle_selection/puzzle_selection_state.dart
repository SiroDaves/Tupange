part of 'puzzle_selection_cubit.dart';

abstract class PuzzleSelectionState extends Equatable {
  const PuzzleSelectionState();

  @override
  List<Object> get props => [];
}

class NoPlanetSelected extends PuzzleSelectionState {}

class PlanetSelected extends PuzzleSelectionState {
  final Planet planet;

  const PlanetSelected({required this.planet});

  @override
  List<Object> get props => [planet];
}

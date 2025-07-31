part of 'game_selection_cubit.dart';

abstract class GameSelectionState extends Equatable {
  const GameSelectionState();

  @override
  List<Object> get props => [];
}

class NoGameSelected extends GameSelectionState {}

class GameSelected extends GameSelectionState {
  final Game game;

  const GameSelected({required this.game});

  @override
  List<Object> get props => [game];
}

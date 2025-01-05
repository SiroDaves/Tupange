part of 'game_puzzle_bloc.dart';

abstract class GamePuzzleEvent extends Equatable {
  const GamePuzzleEvent();

  @override
  List<Object?> get props => [];
}

class PlanetPuzzleResetEvent extends GamePuzzleEvent {
  const PlanetPuzzleResetEvent();
}

class PlanetCountdownStarted extends GamePuzzleEvent {
  const PlanetCountdownStarted();
}

class PlanetCountdownTicked extends GamePuzzleEvent {
  const PlanetCountdownTicked();
}

class PlanetCountdownStopped extends GamePuzzleEvent {
  const PlanetCountdownStopped();
}

class PlanetCountdownReset extends GamePuzzleEvent {
  const PlanetCountdownReset({this.secondsToBegin});

  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}

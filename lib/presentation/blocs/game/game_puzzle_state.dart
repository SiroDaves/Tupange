part of 'game_puzzle_bloc.dart';

enum GamePuzzleStatus {
  notStarted,
  loading,
  started,
}

class PlanetPuzzleState extends Equatable {
  const PlanetPuzzleState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  GamePuzzleStatus get status => isCountdownRunning && secondsToBegin > 0
      ? GamePuzzleStatus.loading
      : (secondsToBegin == 0
          ? GamePuzzleStatus.started
          : GamePuzzleStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  PlanetPuzzleState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return PlanetPuzzleState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}

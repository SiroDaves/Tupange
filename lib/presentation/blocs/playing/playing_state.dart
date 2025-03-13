part of 'playing_bloc.dart';

enum PlayingStatus { notStarted, loading, started }

class PlayingState extends Equatable {
  const PlayingState({
    required this.secondsToBegin,
    this.isCountdownRunning = false,
  });

  /// Whether the countdown of this puzzle is currently running.
  final bool isCountdownRunning;

  /// The number of seconds before the puzzle is started.
  final int secondsToBegin;

  /// The status of the current puzzle.
  PlayingStatus get status => isCountdownRunning && secondsToBegin > 0
      ? PlayingStatus.loading
      : (secondsToBegin == 0 ? PlayingStatus.started : PlayingStatus.notStarted);

  @override
  List<Object> get props => [isCountdownRunning, secondsToBegin];

  PlayingState copyWith({
    bool? isCountdownRunning,
    int? secondsToBegin,
  }) {
    return PlayingState(
      isCountdownRunning: isCountdownRunning ?? this.isCountdownRunning,
      secondsToBegin: secondsToBegin ?? this.secondsToBegin,
    );
  }
}

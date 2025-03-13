part of 'playing_bloc.dart';

abstract class PlayingEvent extends Equatable {
  const PlayingEvent();

  @override
  List<Object?> get props => [];
}

class ResetEvent extends PlayingEvent {
  const ResetEvent();
}

class CountdownStarted extends PlayingEvent {
  const CountdownStarted();
}

class CountdownTicked extends PlayingEvent {
  const CountdownTicked();
}

class CountdownStopped extends PlayingEvent {
  const CountdownStopped();
}

class CountdownReset extends PlayingEvent {
  const CountdownReset({this.secondsToBegin});

  final int? secondsToBegin;

  @override
  List<Object?> get props => [secondsToBegin];
}

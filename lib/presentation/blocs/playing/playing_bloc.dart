import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/ticker.dart';

part 'playing_event.dart';
part 'playing_state.dart';

class GameBloc extends Bloc<PlayingEvent, PlayingState> {
  final int secondsToBegin;

  final Ticker _ticker;

  StreamSubscription<int>? tickerSubscription;

  GameBloc({
    required this.secondsToBegin,
    required Ticker ticker,
  })  : _ticker = ticker,
        super(PlayingState(secondsToBegin: secondsToBegin)) {
    on<CountdownStarted>(onCountdownStarted);
    on<CountdownTicked>(onCountdownTicked);
    on<CountdownStopped>(onCountdownStopped);
    on<CountdownReset>(onCountdownReset);
    on<ResetEvent>(onResetEvent);
  }

  void onResetEvent(
    ResetEvent event,
    Emitter<PlayingState> emit,
  ) {
    emit(state.copyWith(
      secondsToBegin: secondsToBegin,
      isCountdownRunning: false,
    ));
  }

  void startTicker() {
    tickerSubscription?.cancel();
    tickerSubscription =
        _ticker.tick().listen((_) => add(const CountdownTicked()));
  }

  void onCountdownStarted(
    CountdownStarted event,
    Emitter<PlayingState> emit,
  ) {
    startTicker();
    emit(
      state.copyWith(
        isCountdownRunning: true,
        secondsToBegin: secondsToBegin,
      ),
    );
  }

  void onCountdownTicked(
    CountdownTicked event,
    Emitter<PlayingState> emit,
  ) {
    if (state.secondsToBegin == 0) {
      tickerSubscription?.pause();
      emit(state.copyWith(isCountdownRunning: false));
    } else {
      emit(state.copyWith(secondsToBegin: state.secondsToBegin - 1));
    }
  }

  void onCountdownStopped(
    CountdownStopped event,
    Emitter<PlayingState> emit,
  ) {
    tickerSubscription?.pause();
    emit(
      state.copyWith(
        isCountdownRunning: false,
        secondsToBegin: secondsToBegin,
      ),
    );
  }

  void onCountdownReset(
    CountdownReset event,
    Emitter<PlayingState> emit,
  ) {
    startTicker();
    emit(
      state.copyWith(
        isCountdownRunning: true,
        secondsToBegin: event.secondsToBegin,
      ),
    );
  }

  @override
  Future<void> close() {
    tickerSubscription?.cancel();
    return super.close();
  }
}

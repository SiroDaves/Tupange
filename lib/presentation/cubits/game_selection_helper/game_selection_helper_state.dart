part of 'game_selection_helper_cubit.dart';

class GameSelectionHelperState extends Equatable {
  final bool isPaused;

  const GameSelectionHelperState({this.isPaused = false});

  GameSelectionHelperState copyWith({
    bool? isPaused,
  }) {
    return GameSelectionHelperState(
      isPaused: isPaused ?? this.isPaused,
    );
  }

  @override
  List<Object> get props => [isPaused];
}

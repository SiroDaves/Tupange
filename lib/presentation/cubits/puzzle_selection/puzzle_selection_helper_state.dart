part of 'puzzle_selection_helper_cubit.dart';

class PuzzleSelectionHelperState extends Equatable {
  final bool isPaused;

  const PuzzleSelectionHelperState({this.isPaused = false});

  PuzzleSelectionHelperState copyWith({
    bool? isPaused,
  }) {
    return PuzzleSelectionHelperState(
      isPaused: isPaused ?? this.isPaused,
    );
  }

  @override
  List<Object> get props => [isPaused];
}

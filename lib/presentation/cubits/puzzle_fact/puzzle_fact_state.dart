part of 'puzzle_fact_cubit.dart';

class PuzzleFactState extends Equatable {
  final String fact;

  const PuzzleFactState({this.fact = ''});

  @override
  List<Object> get props => [fact];
}

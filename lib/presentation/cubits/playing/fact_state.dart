part of 'fact_cubit.dart';

class FactState extends Equatable {
  final String fact;

  const FactState({this.fact = ''});

  @override
  List<Object> get props => [fact];
}

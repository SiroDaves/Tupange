part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeReady extends HomeState {
  final List<Orbit> orbits;
  //final List<Game> games;

  const HomeReady(this.orbits);

  @override
  List<Object> get props => [orbits];
}

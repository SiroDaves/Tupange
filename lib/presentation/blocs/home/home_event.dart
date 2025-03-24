part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialized extends HomeEvent {
  final Size size;

  const HomeInitialized(this.size);

  @override
  List<Object> get props => [size];
}

class HomeResized extends HomeEvent {
  final Size size;

  const HomeResized(this.size);

  @override
  List<Object> get props => [size];
}

part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuLoading extends MenuState {}

class MenuReady extends MenuState {
  final List<Game> games;

  const MenuReady(this.games);

  @override
  List<Object> get props => [games];
}

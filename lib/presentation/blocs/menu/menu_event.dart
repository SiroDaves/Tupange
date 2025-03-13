part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class MenuInitialized extends MenuEvent {
  final Size size;

  const MenuInitialized(this.size);

  @override
  List<Object> get props => [size];
}

class MenuResized extends MenuEvent {
  final Size size;

  const MenuResized(this.size);

  @override
  List<Object> get props => [size];
}

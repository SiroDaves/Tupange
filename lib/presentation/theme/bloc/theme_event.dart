part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ThemeChangedEvent extends ThemeEvent {
  final Game game;

  const ThemeChangedEvent({required this.game});

  @override
  List<Object?> get props => [game];
}

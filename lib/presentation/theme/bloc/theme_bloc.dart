import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/game.dart';
import '../themes/puzzle_theme_one.dart';
import '../themes/puzzle_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static PuzzleTheme _getTheme(Game game) {
    return PuzzleThemeOne();
  }

  ThemeBloc({required Game game})
      : super(ThemeState(theme: _getTheme(game))) {
    on<ThemeChangedEvent>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChangedEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(theme: _getTheme(event.game)));
  }
}

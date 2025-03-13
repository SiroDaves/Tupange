import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/puzzle_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static PuzzleTheme getTheme(PuzzleTheme theme) {
    return theme;
  }

  ThemeBloc({required PuzzleTheme theme})
      : super(ThemeState(theme: getTheme(theme))) {
    on<ThemeChangedEvent>(onThemeChanged);
  }

  void onThemeChanged(ThemeChangedEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(theme: getTheme(event.theme)));
  }
}

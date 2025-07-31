import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/game.dart';
import '../../../data/models/planet.dart';
import '../themes/earth_puzzle_theme.dart';
import '../themes/jupiter_puzzle_theme.dart';
import '../themes/mars_puzzle_theme.dart';
import '../themes/mercury_puzzle_theme.dart';
import '../themes/neptune_puzzle_theme.dart';
import '../themes/pluto_puzzle_theme.dart';
import '../themes/puzzle_theme.dart';
import '../themes/saturn_puzzle_theme.dart';
import '../themes/uranus_puzzle_theme.dart';
import '../themes/venus_puzzle_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

const Map<PlanetType, PuzzleTheme> _planetThemeMap = {
  PlanetType.mercury: MercuryPuzzleTheme(),
  PlanetType.venus: VenusPuzzleTheme(),
  PlanetType.earth: EarthPuzzleTheme(),
  PlanetType.mars: MarsPuzzleTheme(),
  PlanetType.jupiter: JupiterPuzzleTheme(),
  PlanetType.saturn: SaturnPuzzleTheme(),
  PlanetType.uranus: UranusPuzzleTheme(),
  PlanetType.neptune: NeptunePuzzleTheme(),
  PlanetType.pluto: PlutoPuzzleTheme(),
};

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static PuzzleTheme _getTheme(Game game) {
    return _planetThemeMap[game.title]!;
  }

  ThemeBloc({required Game game})
      : super(ThemeState(theme: _getTheme(game))) {
    on<ThemeChangedEvent>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChangedEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(theme: _getTheme(event.game)));
  }
}

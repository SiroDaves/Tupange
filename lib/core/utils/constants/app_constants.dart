import 'package:flutter/material.dart';

import '../../../data/models/planet.dart';
import '../../../data/models/puzzle.dart';

class AppConstants {
// theme
  static const kFontFamily = 'Freshman';

  static const kProjectDomain = 'fph-planets.web.app';
  static const kUrl = 'https://$kProjectDomain/#/';
  static const kGithubUrl = 'https://github.com/SiroDaves/Tupange';

// puzzle solving durations expected for perfect score
  static const k3PuzzleDuration = Duration(minutes: 2);
  static const k4PuzzleDuration = Duration(minutes: 5);
  static const k5PuzzleDuration = Duration(minutes: 8);

// durations
  static const kMS50 = Duration(milliseconds: 50);
  static const kMS100 = Duration(milliseconds: 100);
  static const kMS150 = Duration(milliseconds: 150);
  static const kMS200 = Duration(milliseconds: 200);
  static const kMS250 = Duration(milliseconds: 250);
  static const kMS300 = Duration(milliseconds: 300);
  static const kMS350 = Duration(milliseconds: 350);
  static const kMS400 = Duration(milliseconds: 400);
  static const kMS500 = Duration(milliseconds: 500);
  static const kMS800 = Duration(milliseconds: 800);
  static const kS1 = Duration(seconds: 1);
  static const kS4 = Duration(seconds: 4);
  static const kS20 = Duration(seconds: 20);

// fractional offset
  static const kFOTopLeft = FractionalOffset(0.05, 0.05);
  static const kFOTopRight = FractionalOffset(0.95, 0.05);
  static const kFOTopCenter = FractionalOffset(0.5, 0.05);
  static const kFOBottomLeft = FractionalOffset(0.05, 0.98);
  static const kFOBottomRight = FractionalOffset(0.95, 0.98);
  static const kFOBottomCenter = FractionalOffset(0.50, 0.98);

// background
  static const kBaseStarSize = 10.0;
  static const kMinStarPercentage = 0.20;
  static const kNoStars = 40;
  static const kBackgroundGradient = [
    Color(0xff0a0826),
    Color(0xff251f45),
    Color(0xff242021),
    Color(0xff251f58),
  ];

// dashboard
  /// I know Pluto is not a planet, but I feel bad excluding him,
  /// besides, it's just a game, no need to be so strict about Pluto :-D
  static const kTotalPlanets = 9;

  static const Map<PuzzleLevel, int> kPuzzleLevel = {
    PuzzleLevel.easy: 3,
    PuzzleLevel.medium: 4,
    PuzzleLevel.hard: 5,
  };

// planet sizes
// 0.383	0.949	1	0.532	11.21	9.45	4.01	3.88	0.187
  static const Map<PlanetType, double> kPlanetSizeFactor = {
    PlanetType.mercury: 0.383,
    PlanetType.venus: 0.949, // venus
    PlanetType.earth: 1, // earth
    PlanetType.mars: 0.532, // mars
    PlanetType.jupiter: 3.0, // 11.21,
    PlanetType.saturn: 2.3, // 9.45,
    PlanetType.uranus: 1.15, //4.01,
    PlanetType.neptune: 1.02, // 3.88,
    PlanetType.pluto: 0.25, // 0.187,
  };

  /// Revolution periods of all planets - to be used for animation period calculation
// Planet	Period of Revolution
// Mercury	88 days       0.24
// Venus	224.7 days      0.62
// Earth	365 days        1
// Mars	687 days          1.88
// Jupiter	11.9 years    11
// Saturn	29.5 years      29
// Uranus	84 years        84
// Neptune	164.8 years   164
// Pluto	247.7 years     247

  static const int kBaseRevolutionSeconds = 10;

  static const Map<PlanetType, double> kRevolutionFactor = {
    PlanetType.mercury: 0.50, // 0.24,
    PlanetType.venus: 0.80, // 0.62,
    PlanetType.earth: 1,
    PlanetType.mars: 1.88,
    PlanetType.jupiter: 3.0, // 11,
    PlanetType.saturn: 6.1, // 29,
    PlanetType.uranus: 9.3, // 84,
    PlanetType.neptune: 12.0, // 164,
    PlanetType.pluto: 16.0, // 247,
  };

  static const Map<PlanetType, double> kRevolutionThresholdFactor = {
    PlanetType.mercury: 1.0,
    PlanetType.venus: 1.0,
    PlanetType.earth: 1.2,
    PlanetType.mars: 0.90,
    PlanetType.jupiter: 1.5,
    PlanetType.saturn: 1.2,
    PlanetType.uranus: 0.80,
    PlanetType.neptune: 0.85,
    PlanetType.pluto: 0.50,
  };

  static const Map<PlanetType, double> kPausedPosition = {
    PlanetType.mercury: 0.60,
    PlanetType.venus: 0.35,
    PlanetType.earth: 0.58,
    PlanetType.mars: 0.46,
    PlanetType.jupiter: 0.55,
    PlanetType.saturn: 0.41,
    PlanetType.uranus: 0.30,
    PlanetType.neptune: 0.53,
    PlanetType.pluto: 0.30,
  };

  static const kMinSunSize = 350.0;

  static const kGreyscaleColorFilter = ColorFilter.matrix(
    <double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ],
  );
}

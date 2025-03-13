import 'package:flutter/material.dart';

class AppDimens {
  AppDimens._();

  /// Max width for a small layout.
  static const double small = 576;

  /// Max width for a medium layout.
  static const double medium = 1400;

  /// Max width for a large layout.
  static const double large = 1700;


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

  static const kTotalPlanets = 9;

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

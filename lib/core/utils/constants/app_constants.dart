import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// import '../../../data/models/planet.dart';
import '../../../data/models/puzzle.dart';
import '../app_utils.dart';

class AppConstants {
  static const appTitle = 'Tupange';

// theme
  static const kFontFamily = 'Freshman';

  static const kProjectDomain = 'fph-planets.web.app';
  static const kUrl = 'https://$kProjectDomain/#/';
  static const kGithubUrl = 'https://github.com/SiroDaves/Tupange';

  static Future<String> get databaseFile async {
    Directory dbFolder = await getApplicationDocumentsDirectory();
    if (isDesktop) {
      dbFolder = await getApplicationSupportDirectory();
    }

    var dbPath = join(dbFolder.path, '$appTitle.db');
    AppUtils.logger('Opening database from: $dbPath');
    return dbPath;
  }

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

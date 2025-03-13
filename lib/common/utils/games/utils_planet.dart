import 'package:flutter/material.dart';

import '../../../data/models/categories/planet.dart';
import '../constants/app_assets.dart';
import '../app_localizationsx.dart';

abstract class UtilsPlanet {
  
  static String name(PlanetType type, BuildContext context) {
    switch (type) {
      case PlanetType.planet1:
        return context.l10n!.planet1;

      case PlanetType.planet2:
        return context.l10n!.planet2;

      case PlanetType.planet3:
        return context.l10n!.planet3;

      case PlanetType.planet4:
        return context.l10n!.planet4;

      case PlanetType.planet5:
        return context.l10n!.planet5;

      case PlanetType.planet6:
        return context.l10n!.planet6;

      case PlanetType.planet7:
        return context.l10n!.planet7;

      case PlanetType.planet8:
        return context.l10n!.planet8;

      case PlanetType.planet9:
        return context.l10n!.planet9;
    }
  }

  static List<String> facts(PlanetType type, BuildContext context) {
    switch (type) {
      case PlanetType.planet1:
        return [
          context.l10n!.planet1Fact1,
          context.l10n!.planet1Fact2,
          context.l10n!.planet1Fact3
        ];

      case PlanetType.planet2:
        return [
          context.l10n!.planet2Fact1,
          context.l10n!.planet2Fact2,
          context.l10n!.planet2Fact3
        ];

      case PlanetType.planet3:
        return [
          context.l10n!.planet3Fact1,
          context.l10n!.planet3Fact2,
          context.l10n!.planet3Fact3
        ];

      case PlanetType.planet4:
        return [
          context.l10n!.planet4Fact1,
          context.l10n!.planet4Fact2,
          context.l10n!.planet4Fact3
        ];

      case PlanetType.planet5:
        return [
          context.l10n!.planet5Fact1,
          context.l10n!.planet5Fact2,
          context.l10n!.planet5Fact3
        ];

      case PlanetType.planet6:
        return [
          context.l10n!.planet6Fact1,
          context.l10n!.planet6Fact2,
          context.l10n!.planet6Fact3
        ];

      case PlanetType.planet7:
        return [
          context.l10n!.planet7Fact1,
          context.l10n!.planet7Fact2,
          context.l10n!.planet7Fact3
        ];

      case PlanetType.planet8:
        return [
          context.l10n!.planet8Fact1,
          context.l10n!.planet8Fact2,
          context.l10n!.planet8Fact3
        ];

      case PlanetType.planet9:
        return [
          context.l10n!.planet9Fact1,
          context.l10n!.planet9Fact2,
          context.l10n!.planet9Fact3
        ];
    }
  }

  static String image(PlanetType type) {
    switch (type) {
      case PlanetType.planet1:
        return AppAssets.planet1Image;

      case PlanetType.planet2:
        return AppAssets.planet2Image;

      case PlanetType.planet3:
        return AppAssets.planet3Image;

      case PlanetType.planet4:
        return AppAssets.planet4Image;

      case PlanetType.planet5:
        return AppAssets.planet5Image;

      case PlanetType.planet6:
        return AppAssets.planet6Image;

      case PlanetType.planet7:
        return AppAssets.planet7Image;

      case PlanetType.planet8:
        return AppAssets.planet8Image;

      case PlanetType.planet9:
        return AppAssets.planet9Image;
    }
  }

}

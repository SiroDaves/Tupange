import 'package:flutter/material.dart';

import '../../../data/models/categories/animal.dart';
import '../constants/app_assets.dart';
import '../app_localizationsx.dart';

abstract class UtilsAnimal {
  static String name(AnimalType type, BuildContext context) {
    switch (type) {
      case AnimalType.animal1:
        return context.l10n!.animal1;

      case AnimalType.animal2:
        return context.l10n!.animal2;

      case AnimalType.animal3:
        return context.l10n!.animal3;

      case AnimalType.animal4:
        return context.l10n!.animal4;

      case AnimalType.animal5:
        return context.l10n!.animal5;

      case AnimalType.animal6:
        return context.l10n!.animal6;

      case AnimalType.animal7:
        return context.l10n!.animal7;

      case AnimalType.animal8:
        return context.l10n!.animal8;

      case AnimalType.animal9:
        return context.l10n!.animal8;

      case AnimalType.animal10:
        return context.l10n!.animal10;

      case AnimalType.animal11:
        return context.l10n!.animal11;

      case AnimalType.animal12:
        return context.l10n!.animal12;

    }
  }

  static List<String> facts(AnimalType type, BuildContext context) {
    switch (type) {
      case AnimalType.animal1:
        return [
          context.l10n!.animal1Fact1,
          context.l10n!.animal1Fact2,
          context.l10n!.animal1Fact3
        ];

      case AnimalType.animal2:
        return [
          context.l10n!.animal2Fact1,
          context.l10n!.animal2Fact2,
          context.l10n!.animal2Fact3
        ];

      case AnimalType.animal3:
        return [
          context.l10n!.animal3Fact1,
          context.l10n!.animal3Fact2,
          context.l10n!.animal3Fact3
        ];

      case AnimalType.animal4:
        return [
          context.l10n!.animal4Fact1,
          context.l10n!.animal4Fact2,
          context.l10n!.animal4Fact3
        ];

      case AnimalType.animal5:
        return [
          context.l10n!.animal5Fact1,
          context.l10n!.animal5Fact2,
          context.l10n!.animal5Fact3
        ];

      case AnimalType.animal6:
        return [
          context.l10n!.animal6Fact1,
          context.l10n!.animal6Fact2,
          context.l10n!.animal6Fact3
        ];

      case AnimalType.animal7:
        return [
          context.l10n!.animal7Fact1,
          context.l10n!.animal7Fact2,
          context.l10n!.animal7Fact3
        ];

      case AnimalType.animal8:
        return [
          context.l10n!.animal8Fact1,
          context.l10n!.animal8Fact2,
          context.l10n!.animal8Fact3
        ];

      case AnimalType.animal9:
        return [
          context.l10n!.animal9Fact1,
          context.l10n!.animal9Fact2,
          context.l10n!.animal9Fact3
        ];

      case AnimalType.animal10:
        return [
          context.l10n!.animal10Fact1,
          context.l10n!.animal10Fact2,
          context.l10n!.animal10Fact3
        ];

      case AnimalType.animal11:
        return [
          context.l10n!.animal11Fact1,
          context.l10n!.animal11Fact2,
          context.l10n!.animal11Fact3
        ];

      case AnimalType.animal12:
        return [
          context.l10n!.animal12Fact1,
          context.l10n!.animal12Fact2,
          context.l10n!.animal12Fact3
        ];

    }
  }

  static String image(AnimalType type) {
    switch (type) {
      case AnimalType.animal1:
        return AppAssets.animal1Image;
      case AnimalType.animal2:
        return AppAssets.animal2Image;

      case AnimalType.animal3:
        return AppAssets.animal3Image;

      case AnimalType.animal4:
        return AppAssets.animal4Image;

      case AnimalType.animal5:
        return AppAssets.animal5Image;

      case AnimalType.animal6:
        return AppAssets.animal6Image;

      case AnimalType.animal7:
        return AppAssets.animal7Image;

      case AnimalType.animal8:
        return AppAssets.animal8Image;

      case AnimalType.animal9:
        return AppAssets.animal9Image;

      case AnimalType.animal10:
        return AppAssets.animal10Image;

      case AnimalType.animal11:
        return AppAssets.animal11Image;

      case AnimalType.animal12:
        return AppAssets.animal12Image;
        
    }
  }
}

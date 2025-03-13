import 'package:flutter/material.dart';

import '../../../data/models/categories/president.dart';
import '../constants/app_assets.dart';
import '../app_localizationsx.dart';

abstract class UtilsPresident {
  static String name(PresidentType type, BuildContext context) {
    switch (type) {
      case PresidentType.president1:
        return context.l10n!.president1;

      case PresidentType.president2:
        return context.l10n!.president2;

      case PresidentType.president3:
        return context.l10n!.president3;

      case PresidentType.president4:
        return context.l10n!.president4;

      case PresidentType.president5:
        return context.l10n!.president5;

      case PresidentType.president6:
        return context.l10n!.president6;

      case PresidentType.president7:
        return context.l10n!.president7;

      case PresidentType.president8:
        return context.l10n!.president8;

      case PresidentType.president9:
        return context.l10n!.president8;

      case PresidentType.president10:
        return context.l10n!.president10;

      case PresidentType.president11:
        return context.l10n!.president11;

      case PresidentType.president12:
        return context.l10n!.president13;

      case PresidentType.president13:
        return context.l10n!.president13;

      case PresidentType.president14:
        return context.l10n!.president14;

    }
  }

  static List<String> facts(PresidentType type, BuildContext context) {
    switch (type) {
      case PresidentType.president1:
        return [
          context.l10n!.president1Fact1,
          context.l10n!.president1Fact2,
          context.l10n!.president1Fact3
        ];

      case PresidentType.president2:
        return [
          context.l10n!.president2Fact1,
          context.l10n!.president2Fact2,
          context.l10n!.president2Fact3
        ];

      case PresidentType.president3:
        return [
          context.l10n!.president3Fact1,
          context.l10n!.president3Fact2,
          context.l10n!.president3Fact3
        ];

      case PresidentType.president4:
        return [
          context.l10n!.president4Fact1,
          context.l10n!.president4Fact2,
          context.l10n!.president4Fact3
        ];

      case PresidentType.president5:
        return [
          context.l10n!.president5Fact1,
          context.l10n!.president5Fact2,
          context.l10n!.president5Fact3
        ];

      case PresidentType.president6:
        return [
          context.l10n!.president6Fact1,
          context.l10n!.president6Fact2,
          context.l10n!.president6Fact3
        ];

      case PresidentType.president7:
        return [
          context.l10n!.president7Fact1,
          context.l10n!.president7Fact2,
          context.l10n!.president7Fact3
        ];

      case PresidentType.president8:
        return [
          context.l10n!.president8Fact1,
          context.l10n!.president8Fact2,
          context.l10n!.president8Fact3
        ];

      case PresidentType.president9:
        return [
          context.l10n!.president9Fact1,
          context.l10n!.president9Fact2,
          context.l10n!.president9Fact3
        ];

      case PresidentType.president10:
        return [
          context.l10n!.president10Fact1,
          context.l10n!.president10Fact2,
          context.l10n!.president10Fact3
        ];

      case PresidentType.president11:
        return [
          context.l10n!.president11Fact1,
          context.l10n!.president11Fact2,
          context.l10n!.president11Fact3
        ];

      case PresidentType.president12:
        return [
          context.l10n!.president12Fact1,
          context.l10n!.president12Fact2,
          context.l10n!.president12Fact3
        ];

      case PresidentType.president13:
        return [
          context.l10n!.president13Fact1,
          context.l10n!.president13Fact2,
          context.l10n!.president13Fact3
        ];

      case PresidentType.president14:
        return [
          context.l10n!.president14Fact1,
          context.l10n!.president14Fact2,
          context.l10n!.president14Fact3
        ];

    }
  }

  static String image(PresidentType type) {
    switch (type) {
      case PresidentType.president1:
        return AppAssets.president1Image;
      case PresidentType.president2:
        return AppAssets.president2Image;

      case PresidentType.president3:
        return AppAssets.president3Image;

      case PresidentType.president4:
        return AppAssets.president4Image;

      case PresidentType.president5:
        return AppAssets.president5Image;

      case PresidentType.president6:
        return AppAssets.president6Image;

      case PresidentType.president7:
        return AppAssets.president7Image;

      case PresidentType.president8:
        return AppAssets.president8Image;

      case PresidentType.president9:
        return AppAssets.president9Image;

      case PresidentType.president10:
        return AppAssets.president10Image;

      case PresidentType.president11:
        return AppAssets.president11Image;

      case PresidentType.president12:
        return AppAssets.president12Image;

      case PresidentType.president13:
        return AppAssets.president13Image;

      case PresidentType.president14:
        return AppAssets.president14Image;
        
    }
  }
}

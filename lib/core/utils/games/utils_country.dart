import 'package:flutter/material.dart';

import '../../../data/models/categories/country.dart';
import '../constants/app_assets.dart';
import '../app_localizationsx.dart';

abstract class UtilsCountry {
  static String name(CountryType type, BuildContext context) {
    switch (type) {
      case CountryType.country1:
        return context.l10n!.country1;

      case CountryType.country2:
        return context.l10n!.country2;

      case CountryType.country3:
        return context.l10n!.country3;

      case CountryType.country4:
        return context.l10n!.country4;

      case CountryType.country5:
        return context.l10n!.country5;

      case CountryType.country6:
        return context.l10n!.country6;

      case CountryType.country7:
        return context.l10n!.country7;

      case CountryType.country8:
        return context.l10n!.country8;

      case CountryType.country9:
        return context.l10n!.country8;

      case CountryType.country10:
        return context.l10n!.country10;

      case CountryType.country11:
        return context.l10n!.country11;

      case CountryType.country12:
        return context.l10n!.country13;

      case CountryType.country13:
        return context.l10n!.country13;

    }
  }

  static List<String> facts(CountryType type, BuildContext context) {
    switch (type) {
      case CountryType.country1:
        return [
          context.l10n!.country1Fact1,
          context.l10n!.country1Fact2,
          context.l10n!.country1Fact3
        ];

      case CountryType.country2:
        return [
          context.l10n!.country2Fact1,
          context.l10n!.country2Fact2,
          context.l10n!.country2Fact3
        ];

      case CountryType.country3:
        return [
          context.l10n!.country3Fact1,
          context.l10n!.country3Fact2,
          context.l10n!.country3Fact3
        ];

      case CountryType.country4:
        return [
          context.l10n!.country4Fact1,
          context.l10n!.country4Fact2,
          context.l10n!.country4Fact3
        ];

      case CountryType.country5:
        return [
          context.l10n!.country5Fact1,
          context.l10n!.country5Fact2,
          context.l10n!.country5Fact3
        ];

      case CountryType.country6:
        return [
          context.l10n!.country6Fact1,
          context.l10n!.country6Fact2,
          context.l10n!.country6Fact3
        ];

      case CountryType.country7:
        return [
          context.l10n!.country7Fact1,
          context.l10n!.country7Fact2,
          context.l10n!.country7Fact3
        ];

      case CountryType.country8:
        return [
          context.l10n!.country8Fact1,
          context.l10n!.country8Fact2,
          context.l10n!.country8Fact3
        ];

      case CountryType.country9:
        return [
          context.l10n!.country9Fact1,
          context.l10n!.country9Fact2,
          context.l10n!.country9Fact3
        ];

      case CountryType.country10:
        return [
          context.l10n!.country10Fact1,
          context.l10n!.country10Fact2,
          context.l10n!.country10Fact3
        ];

      case CountryType.country11:
        return [
          context.l10n!.country11Fact1,
          context.l10n!.country11Fact2,
          context.l10n!.country11Fact3
        ];

      case CountryType.country12:
        return [
          context.l10n!.country12Fact1,
          context.l10n!.country12Fact2,
          context.l10n!.country12Fact3
        ];

      case CountryType.country13:
        return [
          context.l10n!.country13Fact1,
          context.l10n!.country13Fact2,
          context.l10n!.country13Fact3
        ];

    }
  }

  static String image(CountryType type) {
    switch (type) {
      case CountryType.country1:
        return AppAssets.country1Image;
      case CountryType.country2:
        return AppAssets.country2Image;

      case CountryType.country3:
        return AppAssets.country3Image;

      case CountryType.country4:
        return AppAssets.country4Image;

      case CountryType.country5:
        return AppAssets.country5Image;

      case CountryType.country6:
        return AppAssets.country6Image;

      case CountryType.country7:
        return AppAssets.country7Image;

      case CountryType.country8:
        return AppAssets.country8Image;

      case CountryType.country9:
        return AppAssets.country9Image;

      case CountryType.country10:
        return AppAssets.country10Image;

      case CountryType.country11:
        return AppAssets.country11Image;

      case CountryType.country12:
        return AppAssets.country12Image;

      case CountryType.country13:
        return AppAssets.country13Image;

    }
  }
}

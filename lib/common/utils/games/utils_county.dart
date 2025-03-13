import 'package:flutter/material.dart';

import '../../../data/models/categories/county.dart';
import '../constants/app_assets.dart';
import '../app_localizationsx.dart';

abstract class UtilsCounty {
  static String name(CountyType type, BuildContext context) {
    switch (type) {
      case CountyType.county1:
        return context.l10n!.county1;

      case CountyType.county2:
        return context.l10n!.county2;

      case CountyType.county3:
        return context.l10n!.county3;

      case CountyType.county4:
        return context.l10n!.county4;

      case CountyType.county5:
        return context.l10n!.county5;

      case CountyType.county6:
        return context.l10n!.county6;

      case CountyType.county7:
        return context.l10n!.county7;

      case CountyType.county8:
        return context.l10n!.county8;

      case CountyType.county9:
        return context.l10n!.county8;

      case CountyType.county10:
        return context.l10n!.county10;

      case CountyType.county11:
        return context.l10n!.county11;

      case CountyType.county12:
        return context.l10n!.county13;

      case CountyType.county13:
        return context.l10n!.county13;

      case CountyType.county14:
        return context.l10n!.county14;

      case CountyType.county15:
        return context.l10n!.county15;

      case CountyType.county16:
        return context.l10n!.county16;

      case CountyType.county17:
        return context.l10n!.county17;

      case CountyType.county18:
        return context.l10n!.county18;

      case CountyType.county19:
        return context.l10n!.county19;

    }
  }

  static List<String> facts(CountyType type, BuildContext context) {
    switch (type) {
      case CountyType.county1:
        return [
          context.l10n!.county1Fact1,
          context.l10n!.county1Fact2,
          context.l10n!.county1Fact3
        ];

      case CountyType.county2:
        return [
          context.l10n!.county2Fact1,
          context.l10n!.county2Fact2,
          context.l10n!.county2Fact3
        ];

      case CountyType.county3:
        return [
          context.l10n!.county3Fact1,
          context.l10n!.county3Fact2,
          context.l10n!.county3Fact3
        ];

      case CountyType.county4:
        return [
          context.l10n!.county4Fact1,
          context.l10n!.county4Fact2,
          context.l10n!.county4Fact3
        ];

      case CountyType.county5:
        return [
          context.l10n!.county5Fact1,
          context.l10n!.county5Fact2,
          context.l10n!.county5Fact3
        ];

      case CountyType.county6:
        return [
          context.l10n!.county6Fact1,
          context.l10n!.county6Fact2,
          context.l10n!.county6Fact3
        ];

      case CountyType.county7:
        return [
          context.l10n!.county7Fact1,
          context.l10n!.county7Fact2,
          context.l10n!.county7Fact3
        ];

      case CountyType.county8:
        return [
          context.l10n!.county8Fact1,
          context.l10n!.county8Fact2,
          context.l10n!.county8Fact3
        ];

      case CountyType.county9:
        return [
          context.l10n!.county9Fact1,
          context.l10n!.county9Fact2,
          context.l10n!.county9Fact3
        ];

      case CountyType.county10:
        return [
          context.l10n!.county10Fact1,
          context.l10n!.county10Fact2,
          context.l10n!.county10Fact3
        ];

      case CountyType.county11:
        return [
          context.l10n!.county11Fact1,
          context.l10n!.county11Fact2,
          context.l10n!.county11Fact3
        ];

      case CountyType.county12:
        return [
          context.l10n!.county12Fact1,
          context.l10n!.county12Fact2,
          context.l10n!.county12Fact3
        ];

      case CountyType.county13:
        return [
          context.l10n!.county13Fact1,
          context.l10n!.county13Fact2,
          context.l10n!.county13Fact3
        ];

      case CountyType.county14:
        return [
          context.l10n!.county14Fact1,
          context.l10n!.county14Fact2,
          context.l10n!.county14Fact3
        ];

      case CountyType.county15:
        return [
          context.l10n!.county15Fact1,
          context.l10n!.county15Fact2,
          context.l10n!.county15Fact3
        ];

      case CountyType.county16:
        return [
          context.l10n!.county16Fact1,
          context.l10n!.county16Fact2,
          context.l10n!.county16Fact3
        ];

      case CountyType.county17:
        return [
          context.l10n!.county17Fact1,
          context.l10n!.county17Fact2,
          context.l10n!.county17Fact3
        ];

      case CountyType.county18:
        return [
          context.l10n!.county18Fact1,
          context.l10n!.county18Fact2,
          context.l10n!.county18Fact3
        ];

      case CountyType.county19:
        return [
          context.l10n!.county19Fact1,
          context.l10n!.county19Fact2,
          context.l10n!.county19Fact3
        ];

    }
  }

  static String image(CountyType type) {
    switch (type) {
      case CountyType.county1:
        return AppAssets.county1Image;
      case CountyType.county2:
        return AppAssets.county2Image;

      case CountyType.county3:
        return AppAssets.county3Image;

      case CountyType.county4:
        return AppAssets.county4Image;

      case CountyType.county5:
        return AppAssets.county5Image;

      case CountyType.county6:
        return AppAssets.county6Image;

      case CountyType.county7:
        return AppAssets.county7Image;

      case CountyType.county8:
        return AppAssets.county8Image;

      case CountyType.county9:
        return AppAssets.county9Image;

      case CountyType.county10:
        return AppAssets.county10Image;

      case CountyType.county11:
        return AppAssets.county11Image;

      case CountyType.county12:
        return AppAssets.county12Image;

      case CountyType.county13:
        return AppAssets.county13Image;

      case CountyType.county14:
        return AppAssets.county14Image;

      case CountyType.county15:
        return AppAssets.county15Image;

      case CountyType.county16:
        return AppAssets.county16Image;

      case CountyType.county17:
        return AppAssets.county17Image;

      case CountyType.county18:
        return AppAssets.county18Image;

      case CountyType.county19:
        return AppAssets.county19Image;
        
    }
  }
}

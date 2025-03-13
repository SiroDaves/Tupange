import 'package:flutter/material.dart';

import '../../../data/models/categories/vehicle.dart';
import '../constants/app_assets.dart';
import '../app_localizationsx.dart';

abstract class UtilsVehicle {
  static String name(VehicleType type, BuildContext context) {
    switch (type) {
      case VehicleType.vehicle1:
        return context.l10n!.vehicle1;

      case VehicleType.vehicle2:
        return context.l10n!.vehicle2;

      case VehicleType.vehicle3:
        return context.l10n!.vehicle3;

      case VehicleType.vehicle4:
        return context.l10n!.vehicle4;

      case VehicleType.vehicle5:
        return context.l10n!.vehicle5;

      case VehicleType.vehicle6:
        return context.l10n!.vehicle6;

      case VehicleType.vehicle7:
        return context.l10n!.vehicle7;

    }
  }

  static List<String> facts(VehicleType type, BuildContext context) {
    switch (type) {
      case VehicleType.vehicle1:
        return [
          context.l10n!.vehicle1Fact1,
          context.l10n!.vehicle1Fact2,
          context.l10n!.vehicle1Fact3
        ];

      case VehicleType.vehicle2:
        return [
          context.l10n!.vehicle2Fact1,
          context.l10n!.vehicle2Fact2,
          context.l10n!.vehicle2Fact3
        ];

      case VehicleType.vehicle3:
        return [
          context.l10n!.vehicle3Fact1,
          context.l10n!.vehicle3Fact2,
          context.l10n!.vehicle3Fact3
        ];

      case VehicleType.vehicle4:
        return [
          context.l10n!.vehicle4Fact1,
          context.l10n!.vehicle4Fact2,
          context.l10n!.vehicle4Fact3
        ];

      case VehicleType.vehicle5:
        return [
          context.l10n!.vehicle5Fact1,
          context.l10n!.vehicle5Fact2,
          context.l10n!.vehicle5Fact3
        ];

      case VehicleType.vehicle6:
        return [
          context.l10n!.vehicle6Fact1,
          context.l10n!.vehicle6Fact2,
          context.l10n!.vehicle6Fact3
        ];
        
      case VehicleType.vehicle7:
        return [
          context.l10n!.vehicle7Fact1,
          context.l10n!.vehicle7Fact2,
          context.l10n!.vehicle7Fact3
        ];
        
    }
  }

  static String image(VehicleType type) {
    switch (type) {
      case VehicleType.vehicle1:
        return AppAssets.vehicle1Image;
      case VehicleType.vehicle2:
        return AppAssets.vehicle2Image;

      case VehicleType.vehicle3:
        return AppAssets.vehicle3Image;

      case VehicleType.vehicle4:
        return AppAssets.vehicle4Image;

      case VehicleType.vehicle5:
        return AppAssets.vehicle5Image;

      case VehicleType.vehicle6:
        return AppAssets.vehicle6Image;

      case VehicleType.vehicle7:
        return AppAssets.vehicle7Image;

    }
  }
}

import 'package:tupange/core/l10n/l10n.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/models/planet.dart';
import '../../data/models/position.dart';
import '../resource/app_assets.dart';
import 'app_utils.dart';

const _paddingOffset = 5.0;
const _roundOffset = 15.0;
const _radius = Radius.circular(_roundOffset);

abstract class PuzzleUtils {

  static bool isOptimizedPuzzle() {
    /// if in web, run optimized puzzle for mobile browsers
    if (kIsWeb) {
      final userAgent =
          html.window.navigator.userAgent.toString().toLowerCase();

      AppUtils.logger('Utils :: isOptimizedPuzzle: userAgent: $userAgent');

      if (userAgent.contains("iphone") || userAgent.contains("android")) {
        return true;
      }
    }

    return false;
  }

  static String planetName(PlanetType type, BuildContext context) {
    switch (type) {
      case PlanetType.mercury:
        return context.l10n.mercury;

      case PlanetType.venus:
        return context.l10n.venus;

      case PlanetType.earth:
        return context.l10n.earth;

      case PlanetType.mars:
        return context.l10n.mars;

      case PlanetType.jupiter:
        return context.l10n.jupiter;

      case PlanetType.saturn:
        return context.l10n.saturn;

      case PlanetType.uranus:
        return context.l10n.uranus;

      case PlanetType.neptune:
        return context.l10n.neptune;

      case PlanetType.pluto:
        return context.l10n.pluto;
    }
  }

  static List<String> planetFacts(PlanetType type, BuildContext context) {
    switch (type) {
      case PlanetType.mercury:
        return [
          context.l10n.mercuryFact1,
          context.l10n.mercuryFact2,
          context.l10n.mercuryFact3
        ];

      case PlanetType.venus:
        return [
          context.l10n.venusFact1,
          context.l10n.venusFact2,
          context.l10n.venusFact3
        ];

      case PlanetType.earth:
        return [
          context.l10n.earthFact1,
          context.l10n.earthFact2,
          context.l10n.earthFact3
        ];

      case PlanetType.mars:
        return [
          context.l10n.marsFact1,
          context.l10n.marsFact2,
          context.l10n.marsFact3
        ];

      case PlanetType.jupiter:
        return [
          context.l10n.jupiterFact1,
          context.l10n.jupiterFact2,
          context.l10n.jupiterFact3
        ];

      case PlanetType.saturn:
        return [
          context.l10n.saturnFact1,
          context.l10n.saturnFact2,
          context.l10n.saturnFact3
        ];

      case PlanetType.uranus:
        return [
          context.l10n.uranusFact1,
          context.l10n.uranusFact2,
          context.l10n.uranusFact3
        ];

      case PlanetType.neptune:
        return [
          context.l10n.neptuneFact1,
          context.l10n.neptuneFact2,
          context.l10n.neptuneFact3
        ];

      case PlanetType.pluto:
        return [
          context.l10n.plutoFact1,
          context.l10n.plutoFact2,
          context.l10n.plutoFact3
        ];
    }
  }
  static String getPlanetImageFor(PlanetType type) {
    switch (type) {
      case PlanetType.mercury:
        return AppAssets.mercuryImage;

      case PlanetType.venus:
        return AppAssets.venusImage;

      case PlanetType.earth:
        return AppAssets.earthImage;

      case PlanetType.mars:
        return AppAssets.marsImage;

      case PlanetType.jupiter:
        return AppAssets.jupiterImage;

      case PlanetType.saturn:
        return AppAssets.saturnImage;

      case PlanetType.uranus:
        return AppAssets.uranusImage;

      case PlanetType.neptune:
        return AppAssets.neptuneImage;

      case PlanetType.pluto:
        return AppAssets.plutoImage;
    }
  }

  static String getPlanetThumbFor(PlanetType type) {
    switch (type) {
      case PlanetType.mercury:
        return AppAssets.mercuryThumb;

      case PlanetType.venus:
        return AppAssets.venusThumb;

      case PlanetType.earth:
        return AppAssets.earthThumb;

      case PlanetType.mars:
        return AppAssets.marsThumb;

      case PlanetType.jupiter:
        return AppAssets.jupiterThumb;

      case PlanetType.saturn:
        return AppAssets.saturnThumb;

      case PlanetType.uranus:
        return AppAssets.uranusThumb;

      case PlanetType.neptune:
        return AppAssets.neptuneThumb;

      case PlanetType.pluto:
        return AppAssets.plutoThumb;
    }
  }

  static String getPlanetAnimationFor(PlanetType type) {
    switch (type) {
      case PlanetType.mercury:
        return AppAssets.mercuryAnimation;

      case PlanetType.venus:
        return AppAssets.venusAnimation;

      case PlanetType.earth:
        return AppAssets.earthAnimation;

      case PlanetType.mars:
        return AppAssets.marsAnimation;

      case PlanetType.jupiter:
        return AppAssets.jupiterAnimation;

      case PlanetType.saturn:
        return AppAssets.saturnAnimation;

      case PlanetType.uranus:
        return AppAssets.uranusAnimation;

      case PlanetType.neptune:
        return AppAssets.neptuneAnimation;

      case PlanetType.pluto:
        return AppAssets.plutoAnimation;
    }
  }

  static Path getPuzzlePath(
    Size size,
    int puzzleSize,
    Position correctPosition,
  ) {
    double width = (size.width / puzzleSize);
    double height = (size.height / puzzleSize);

    double offsetX = correctPosition.x * width;
    double offsetY = correctPosition.y * height;

    width -= _paddingOffset;
    height -= _paddingOffset;

    final path = Path();

    path.moveTo(offsetX + _roundOffset, offsetY);
    path.lineTo(offsetX + width - _roundOffset, offsetY);

    path.arcToPoint(
      Offset(offsetX + width, offsetY + _roundOffset),
      radius: _radius,
    );

    path.lineTo(offsetX + width, offsetY + height - _roundOffset);

    path.arcToPoint(
      Offset(offsetX + width - _roundOffset, offsetY + height),
      radius: _radius,
    );

    path.lineTo(offsetX + _roundOffset, offsetY + height);

    path.arcToPoint(
      Offset(offsetX, offsetY + height - _roundOffset),
      radius: _radius,
    );

    path.lineTo(offsetX, offsetY + _roundOffset);

    path.arcToPoint(
      Offset(offsetX + _roundOffset, offsetY),
      radius: _radius,
    );

    return path;
  }
}

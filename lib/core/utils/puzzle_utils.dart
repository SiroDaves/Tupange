import 'package:tupange/core/l10n/l10n.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/models/game.dart';
import '../../data/models/position.dart';
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

  static List<String> getFactsFor(Game game, BuildContext context) {
    return [
      context.l10n.mercuryFact1,
      context.l10n.mercuryFact2,
      context.l10n.mercuryFact3
    ];
  }

  static Image getImagePath(String image) {
    return Image.asset('images/$image.jpg');
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

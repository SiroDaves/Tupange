import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/game.dart';
import '../../data/models/position.dart';
import 'app_logger.dart';
import 'app_localizationsx.dart';
import 'constants/app_dimens.dart';

const _paddingOffset = 5.0;
const _roundOffset = 15.0;
const _radius = Radius.circular(_roundOffset);

abstract class Utils {
  static bool isOptimizedPuzzle() {
    /// if in web, run optimized puzzle for mobile browsers
    if (kIsWeb) {
      final userAgent =
          html.window.navigator.userAgent.toString().toLowerCase();

      AppLogger.log('Utils :: isOptimizedPuzzle: userAgent: $userAgent');

      if (userAgent.contains("iphone") || userAgent.contains("android")) {
        return true;
      }
    }

    return false;
  }

  static Future<Widget> buildPageAsync(Widget page) {
    return Future.microtask(() {
      return page;
    });
  }

  static String getSuccessExtraText({
    required int totalSteps,
    required int autoSolverSteps,
  }) {
    final f = autoSolverSteps / totalSteps;

    if (f > 0.85) {
      return '(though we helped a lot)';
    }

    if (f > 0.30) {
      return 'with a fair bit of help';
    }

    if (f > 0) {
      return 'without much aid';
    }

    // haven't used auto solver
    return 'without any aid';
  }

  static Future<Uint8List?> capturePng(GlobalKey key) async {
    final boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) return null;
    final ui.Image image =
        await boundary.toImage(pixelRatio: kIsWeb ? 1.2 : 2.0);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  static String sharableText(String planetName, BuildContext context) {
    return context.l10n!.sharableText(planetName);
  }

  static Future<void> openLink(String url, {VoidCallback? onError}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else if (onError != null) {
      AppLogger.log('cannot open link for url $url');
      onError();
    }
  }

  static int getScore({
    required int secondsTaken,
    required int totalSteps,
    required int autoSolverSteps,
    required int puzzleSize,
  }) {
    int totalScore = 5;

    switch (puzzleSize) {
      case 3:
        if (secondsTaken > AppDimens.k3PuzzleDuration.inSeconds) totalScore--;
        break;

      case 4:
        if (secondsTaken > AppDimens.k4PuzzleDuration.inSeconds) totalScore--;
        break;

      case 5:
        if (secondsTaken > AppDimens.k5PuzzleDuration.inSeconds) totalScore--;
        break;
    }

    // if used autosolver, decrease points
    if (autoSolverSteps != 0) {
      if (totalScore >= 4) {
        totalScore -= 2;
      } else {
        totalScore--;
      }
    }

    // penalty for too many steps
    if (totalSteps > 500) totalScore--;

    // min score a user can get is 1, for worst case scenario
    return math.max(1, totalScore);
  }

  static Color darkenColor(Color color, [double amount = 0.30]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  static String get planetRotationAnimationName => 'rotation';

  static String getFormattedElapsedSeconds(int elapsedSeconds) {
    final duration = Duration(seconds: elapsedSeconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
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

  static String gameName(GameType type, BuildContext context) {
    switch (type) {
      case GameType.animals:
        return context.l10n!.animals;

      case GameType.counties:
        return context.l10n!.counties;

      case GameType.countries:
        return context.l10n!.countries;

      case GameType.planets:
        return context.l10n!.planets;


      case GameType.presidents:
        return context.l10n!.presidents;

      case GameType.vehicles:
        return context.l10n!.vehicles;
    }
  }
}

import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:developer' as logging show log;

import 'package:tupange/core/l10n/l10n.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/planet.dart';
import 'constants/app_constants.dart';
import 'quick_visit_counter.dart';

abstract class AppUtils {
  static void logger(String message) {
    return logging.log('''
$message
  ''');
  }

  static bool isOptimizedPuzzle() {
    /// if in web, run optimized puzzle for mobile browsers
    if (kIsWeb) {
      final userAgent =
          html.window.navigator.userAgent.toString().toLowerCase();

      logger('Utils :: isOptimizedPuzzle: userAgent: $userAgent');

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
    return context.l10n.sharableText(planetName);
  }

  static Future<void> openLink(String url, {VoidCallback? onError}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else if (onError != null) {
      logger('cannot open link for url $url');
      onError();
    }
  }

  static void onGithubTap() {
    QuickVisitCounter.viewOnGithubClicked();
    openLink(AppConstants.kGithubUrl);
  }

  static void onFacebookTap(final String planetName, BuildContext context) {
    final shareText = sharableText(planetName, context);
    final encodedShareText = Uri.encodeComponent(shareText);
    final facebookUrl =
        'https://www.facebook.com/sharer.php?u=${AppConstants.kUrl}&quote=$encodedShareText';
    openLink(facebookUrl);
  }

  static void onTwitterTap(final String planetName, BuildContext context) {
    final shareText = sharableText(planetName, context);
    final encodedShareText = Uri.encodeComponent(shareText);
    final twitterUrl =
        'https://twitter.com/intent/tweet?url=${AppConstants.kUrl}&text=$encodedShareText';
    openLink(twitterUrl);
  }

  static void onDownloadTap(Uint8List? imageData) async {
    if (imageData == null) return;

    try {
      if (kIsWeb) {
        // download the image
        final blob = html.Blob(
          <dynamic>[imageData],
          'application/octet-stream',
        );
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = '${const Uuid().v1()}.png';
        html.document.body?.children.add(anchor);
        anchor.click();
        html.document.body?.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      } else {
        // save the image
        final applicationDir = await getApplicationDocumentsDirectory();
        // ignore: unused_local_variable
        final file =
            await File('${applicationDir.path}/${const Uuid().v1()}.png')
                .writeAsBytes(imageData);
      }
    } catch (e) {
      logger('onDownloadTap: error: $e');
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
        if (secondsTaken > AppConstants.k3PuzzleDuration.inSeconds) totalScore--;
        break;

      case 4:
        if (secondsTaken > AppConstants.k4PuzzleDuration.inSeconds) totalScore--;
        break;

      case 5:
        if (secondsTaken > AppConstants.k5PuzzleDuration.inSeconds) totalScore--;
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

}

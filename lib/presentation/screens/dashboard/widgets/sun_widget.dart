import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/resource/app_assets.dart';
import '../../../../core/utils/constants/app_constants.dart';

class SunWidget extends StatelessWidget {
  const SunWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final parentSize = MediaQuery.of(context).size;
    final double sunSize = math.max(parentSize.width * 0.33, AppConstants.kMinSunSize);

    return Positioned(
      top: parentSize.height / 2 - sunSize / 2,
      left: (-sunSize / 2),
      child: Transform.rotate(
        angle: math.pi / 2,
        child: Image.asset(
          AppAssets.sunImage,
          width: sunSize,
          height: sunSize,
        ),
      ),
    );
  }
}

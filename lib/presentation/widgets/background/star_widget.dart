import 'package:flutter/material.dart';

import '../../../core/utils/constants/app_constants.dart';
import '../../../data/models/star.dart';

class StarWidget extends StatelessWidget {
  final Star star;
  const StarWidget({
    super.key,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: AppConstants.kMS500,
      left: star.pos.x.toDouble(),
      top: star.pos.y.toDouble(),
      width: star.size,
      height: star.size,
      child: Transform.rotate(
        angle: star.rotation,
        child: Icon(
          Icons.star_rounded,
          color: const Color(0xB3ffffff),
          size: star.size,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/utils/puzzle_utils.dart';
import '../../../../data/models/category.dart';
import '../../../widgets/stylized_text.dart';

class MenuCarousel extends StatelessWidget {
  final Category category;
  final double height;
  final bool isLarge;
  final VoidCallback? onPressed;

  const MenuCarousel({
    super.key,
    this.isLarge = false,
    required this.category,
    required this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      highlightColor: Colors.white.withValues(alpha: .1),
      focusElevation: 0,
      hoverColor: Colors.transparent,
      hoverElevation: 1,
      highlightElevation: 0,
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        height: height * .7,
        width: height * 1.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: PuzzleUtils.getAssetImagePath(category.image!),
            fit: BoxFit.cover,
          ),
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: height * .1,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            StylizedText(
              text: category.title!.toUpperCase(),
              fontSize: isLarge ? 48.0 : 36.0,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

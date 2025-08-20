import 'package:flutter/material.dart';

import '../../../../data/models/category.dart';
import '../../../widgets/general/stylized_text.dart';

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
    var bgContainer = Container(
      height: isLarge ? 75.0 : 120.0,
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
    );
    var categoryTitle = StylizedText(
      text: category.title!.toUpperCase(),
      fontSize: isLarge ? 48.0 : 36.0,
      textColor: Colors.white,
    );
    var mainContainer = Container(
      height: height * .7,
      width: height * 1.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(category.image!),
          fit: BoxFit.cover,
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          bgContainer,
          categoryTitle,
        ],
      ),
    );

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
      child: mainContainer,
    );
  }
}

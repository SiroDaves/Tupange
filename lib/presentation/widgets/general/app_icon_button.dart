import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData iconData;

  const AppIconButton({
    super.key,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(iconData, size: 32.0),
    );
  }
}

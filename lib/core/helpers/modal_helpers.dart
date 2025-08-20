import 'package:flutter/material.dart';

import '../../presentation/widgets/general/app_dialog.dart';
import '../utils/constants/app_constants.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required Widget child,
    bool sameSize = false,
  bool barrierDismissible = true,
  String barrierLabel = '',
}) =>
    showGeneralDialog<T>(
      transitionBuilder: (context, animation, secondaryAnimation, widget) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.decelerate,
        );

        return ScaleTransition(
          scale: Tween<double>(begin: 0.9, end: 1).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: widget,
          ),
        );
      },
      transitionDuration: AppConstants.kMS300,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => AppDialog(
        sameSize: sameSize,
        child: child,
      ),
    );

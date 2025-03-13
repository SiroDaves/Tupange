import 'package:flutter/material.dart';

import '../../common/utils/constants/app_constants.dart';

class AppThemeData {
  AppThemeData._();

  static final lightThemeData = mainThemeData.copyWith();

  static ThemeData mainTheme() {
    return mainThemeData.copyWith();
  }

  static final mainThemeData = ThemeData(
    fontFamily: AppConstants.kFontFamily,
    primaryColor: Colors.blue,
    colorScheme:  const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.blue,
      secondary: Colors.blue,
      onSecondary: Colors.blue,
      error: Colors.red,
      onError: Colors.red,
      background: Colors.black,
      onBackground: Colors.blue,
      surface: Colors.blue,
      onSurface: Colors.blue,
    ),
  );
}

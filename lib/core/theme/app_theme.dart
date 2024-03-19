import 'package:profitei_flutter/core/constant/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.kLightPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.kBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.kLightSecondaryColor,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.kLightSecondaryColor)),
    colorScheme: const ColorScheme.light(secondary: AppColors.kLightSecondaryColor)
        .copyWith(background:AppColors.kLightBackgroundColor),
  );

  // static final darkTheme = ThemeData(
  //     brightness: Brightness.dark,
  //     primaryColor: darkPrimaryColor,
  //     visualDensity: VisualDensity.adaptivePlatformDensity,
  //     textButtonTheme: TextButtonThemeData(
  //         style: TextButton.styleFrom(foregroundColor: darkTextColor)),
  //     colorScheme: ColorScheme.light(secondary: lightSecondaryColor)
  //         .copyWith(background: darkBackgroundColor));
}

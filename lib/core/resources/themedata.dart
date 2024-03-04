import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  //
  AppTheme._();

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    cardColor: AppColors.white,
    canvasColor: const Color(0xFFF6F7F6),
    primaryColor: AppColors.white,
    focusColor: AppColors.btBgColor,
    dividerColor: AppColors.white,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: AppColors.white,
      secondary: AppColors.white,
      surfaceVariant: AppColors.transparent,
      surfaceTint: AppColors.white,
    ),
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: AppColors.transparent,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarDividerColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark
      ),
      color: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.btBgColor,
      ),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFFF6F6F6),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 14,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        color: AppColors.C_6A6D7C,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: AppColors.btBgColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

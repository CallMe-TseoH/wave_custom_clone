import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_custom_clone/config/theme/app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: AppColors.white,
          statusBarColor: AppColors.white,
        ),
      ),
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.white,
      splashColor: AppColors.dark.withOpacity(.5),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.blue,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.blue.withOpacity(.35),
        selectionHandleColor: AppColors.blue,
        cursorColor: AppColors.blue,
      ),
      fontFamily: GoogleFonts.inter().fontFamily,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.blue,
      ),
    );
  }
}

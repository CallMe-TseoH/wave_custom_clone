
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_custom_clone/config/theme/app_colors.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/about/pages/about_page.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});
  static const routeName = "/aboutMe";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _buildSystemUiOverlay,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.softGrey,
          iconTheme: IconThemeData(color: AppColors.dark),
          systemOverlayStyle: _buildSystemUiOverlay,
        ),
        body: const AboutPage(),
      ),
    );
  }

  SystemUiOverlayStyle get _buildSystemUiOverlay {
    return SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: AppColors.softGrey,
statusBarColor: AppColors.softGrey
        );
  }
}

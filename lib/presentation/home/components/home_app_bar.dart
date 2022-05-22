import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_custom_clone/config/theme/theme.dart';

AppBar homeAppBar(){
  return AppBar(
    backgroundColor: AppColors.purplishBlue,
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: AppColors.white,
      statusBarColor: AppColors.purplishBlue,
    ),
  );
}
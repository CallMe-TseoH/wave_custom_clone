// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave_custom_clone/config/behaviors/behaviors.dart' show DisableGlowingScrollBehavior;
import 'package:wave_custom_clone/config/routes/routes.dart';
import 'package:wave_custom_clone/config/theme/theme.dart' show AppThemes;
import 'package:wave_custom_clone/l10n/l10n.dart';
import 'package:wave_custom_clone/presentation/security/security.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (Widget? child) {
        return MaterialApp(
          onGenerateRoute: AppRoutes.onGenerateRoute,
          home: ScrollConfiguration(
            behavior: DisableGlowingScrollBehavior(),
            child: child??const SizedBox.shrink(),
          ),
          debugShowCheckedModeBanner: false,
          theme: AppThemes.light,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          initialRoute: Security.routeName,
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },);
  }
}


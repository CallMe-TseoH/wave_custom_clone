import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wave_custom_clone/presentation/security/security.dart';

class AppRoutes {
  AppRoutes._();

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Security.routeName:
        return _pageTransition(const Security());
      default:
        return null;
    }
  }

  static PageTransition<dynamic> _pageTransition(Widget child)
  => PageTransition<dynamic>(
        child: child,
        type: PageTransitionType.rightToLeft,
      );
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wave_custom_clone/domain/entities/entities.dart';
import 'package:wave_custom_clone/presentation/about/about_me.dart';
import 'package:wave_custom_clone/presentation/about/about_me.dart';
import 'package:wave_custom_clone/presentation/home/home.dart';
import 'package:wave_custom_clone/presentation/home/pages/pages.dart';
import 'package:wave_custom_clone/presentation/security/security.dart';

class AppRoutes {
  AppRoutes._();

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Security.routeName:
        return _pageTransition(const Security());
        case Home.routeName:
        return _pageTransition(const Home());
        case AboutMe.routeName:
        return _pageTransition(const AboutMe());
      case TransactionDetailPage.routeName:
        final _transaction = settings.arguments! as TransactionEntity;
        return _pageTransition(TransactionDetailPage(transaction: _transaction,));
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

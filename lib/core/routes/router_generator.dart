import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/routes/app_routes.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/features/login/mobile/login_page_mobile.dart';

class RouterGenerator {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
          path: AppRoutes.login,
          pageBuilder: (context, state) =>
              buildAnimation(state, const LoginPageMobile())),
      GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => buildAnimation(
              state,
              Container(
                height: 500,
                width: 500,
                color: Colors.red,
              ))),
    ],
  );
}

CustomTransitionPage buildAnimation(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    name: state.fullPath,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

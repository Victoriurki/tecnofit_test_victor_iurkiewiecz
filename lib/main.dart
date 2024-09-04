import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/routes/router_generator.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/services/app_services.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/themes/mobile_theme.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/themes/web_theme.dart';

Future<void> main() async {
  await AppServices.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterGenerator.router,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Tecnofit',
      theme: AppServices.currentPlatform == 'Mobile'
          ? MobileTheme.theme()
          : WebTheme.theme(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

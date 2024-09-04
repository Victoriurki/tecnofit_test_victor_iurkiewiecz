import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/app_get_it.dart';

class AppServices {

  static late String currentPlatform;

  static Future<void> setUp() async {
    WidgetsFlutterBinding.ensureInitialized();
    Intl.defaultLocale = 'pt_BR';
    AppGetIt.setUp();
    checkCurrentPlatform();
  }

  static void checkCurrentPlatform() {
    if (!kIsWeb) {
      currentPlatform = 'Mobile';
    } else {
      currentPlatform = 'Web';
    }
  }
  
}

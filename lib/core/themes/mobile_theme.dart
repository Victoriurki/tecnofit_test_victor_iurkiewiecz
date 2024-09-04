import 'package:flutter/material.dart';

class MobileTheme {
  static ThemeData theme() {
    return ThemeData(fontFamily: 'Nunito', appBarTheme: _appBarTheme());
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}

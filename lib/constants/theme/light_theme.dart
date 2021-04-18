import 'package:flutter/material.dart';

import 'app_theme.dart';

class LightTheme extends AppTheme {
  static ThemeData get lightThemeData => ThemeData.light().copyWith(
      primaryColor: Colors.deepPurple,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        bodyText2: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      ));
}

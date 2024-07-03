import 'package:flutter/material.dart';

import 'app_palatte.dart';

class AppTheme{

  static _border({Color color = AppPalette.borderColor}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 0.42,
        color: color,
      ));

  static final darkTheme = ThemeData.dark().copyWith(
    //colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.red),
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'Montserrat',
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(color: AppPalette.borderColor),
      errorBorder: _border(color: AppPalette.borderColor),
      focusedErrorBorder: _border(color: AppPalette.errorColor),
    ),
  );
}
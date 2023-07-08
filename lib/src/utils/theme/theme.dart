import 'package:bookkeep_app/src/constants/colors.dart';
import 'package:bookkeep_app/src/utils/theme/elevated_button_theme.dart';
import 'package:bookkeep_app/src/utils/theme/textthem.dart';
import 'package:flutter/material.dart';

import '../../constants/gen_swatch.dart';

class BookKeepTheme {
  BookKeepTheme._();
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: BookKeepingColors.backgroundColour,
    primaryColor: BookKeepingColors.mainColor,
    primarySwatch: createMaterialColor(const Color(0xff004346)),
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: TextsTheme.lightTheme,
    elevatedButtonTheme: ElevatedButtonThemes.lightTheme,
    fontFamily: 'Livvic',
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff272727),
    primarySwatch: createMaterialColor(const Color(0xff272727)),
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: TextsTheme.darkTheme,
    fontFamily: 'Livvic',
  );
}

import 'package:bookkeep_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TextsTheme {
  static TextTheme lightTheme = const TextTheme(
    //titles
    headlineLarge: TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w700,
      fontSize: 23,
      color: BookKeepingColors.secondaryColor,
    ),
    //elevated buttons
    labelMedium: TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w700,
      fontSize: 19,
      color: BookKeepingColors.secondaryColor,
    ),

    // for chats user
    bodyMedium: TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w700,
      fontSize: 13,
      color: BookKeepingColors.secondaryColor,
    ),
    //reply bot
    bodySmall: TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: BookKeepingColors.secondaryColor,
    ),
  );
  static TextTheme darkTheme = const TextTheme(
    //titles
    headlineLarge: TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w700,
      fontSize: 23,
    ),
    //elevated buttons
    labelMedium: TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w700,
      fontSize: 19,
    ),

    // for chats user
    bodyMedium: TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w700,
      fontSize: 13,
    ),
    //reply bot
    bodySmall: TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
  );
}

// Copyright 2023 Davefurn
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:bookkeep_app/src/constants/colors.dart';
import 'package:flutter/material.dart';


class TextsTheme {
  static TextTheme lightTheme =  const TextTheme(
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
    bodySmall :  TextStyle(
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
    bodySmall : TextStyle(
      fontFamily: 'Livvic',
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    

  );
}

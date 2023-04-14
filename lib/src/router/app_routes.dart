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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Future<T?> pushToWihRouteAndNavKey<T>(GlobalKey<NavigatorState> navKey,Route route ) async{
  return await navKey.currentState!.push(route as Route<T>);
}

Future<T?> pushToWithNavKey<T>(GlobalKey<NavigatorState> navKey, Widget page, [PushStyle? pushStyle]) async{
  return await navKey.currentState!.push(
      pushStyle == PushStyle.cupertino
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page));
}

Future<T?> pushToWithRoute<T>(BuildContext context, Route route) async {
  return await Navigator.push<T>(context, route as Route<T>);
}

Future<T?> pushReplacementToWithRoute<T>(BuildContext context, Route route) async {
  return await Navigator.pushReplacement(context, route as Route<T>);
}

/// Pushes a new route onto the navigator that most tightly encloses the given context.
Future<T?> pushTo<T>(BuildContext context, Widget page,
    [PushStyle? pushStyle]) async {
  return await Navigator.push(
      context,
      pushStyle == PushStyle.cupertino
          ? CupertinoPageRoute(builder: (context) => page)
          : MaterialPageRoute(builder: (context) => page));
}

/// Pushes the given [page] to the navigator and clears the current [page] from the stack
Future<T?> pushReplacementTo<T>(BuildContext context, Widget page, [PushStyle? pushStyle]) async {
  return await Navigator.pushReplacement(
      context, pushStyle == PushStyle.cupertino
      ? CupertinoPageRoute(builder: (context) => page)
      : MaterialPageRoute(builder: (context) => page));
}

/// Pushes the given [page] to the navigator and clears the stack
void pushToAndClearStack(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page), (route) => false);
}

/// Removes the current [page] from the stack
void pop<T>(BuildContext context, [T? value]) {
  return Navigator.pop(context, value);
}

enum PushStyle { material, cupertino }

class CustomRoutes {
  static Route fadeIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.easeInExpo;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route slideIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 4),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = const Offset(10, 0);
        var end = Offset.zero;
        var curve = Curves.easeInExpo;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route slideUp(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds:300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = const Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

}

GestureDetector backButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      pop(context);
    },
    child: const Align(
      alignment: Alignment.centerLeft,
      child: Icon(
        Icons.arrow_back,
        size: 20,
      ),
    ),
  );
}
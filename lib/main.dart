import 'package:bookkeep_app/src/features/authentication/views/login/login.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/sign_up.dart';
import 'package:bookkeep_app/src/features/home/views/home.dart';
import 'package:bookkeep_app/src/features/settings/views/settings_view.dart';
import 'package:bookkeep_app/src/router/router.dart';
import 'package:bookkeep_app/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/features/settings/models/settings_models.dart';

void main() async {
  runApp(ProviderScope(
    child: MyApp(
      navigatorKey: navigatorKey,
    ),
  ));
}

// Future initialization(BuildContext? context) async {
//   ///load resources
//   await Future.delayed(Duration(seconds: 3));

// }

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({super.key, required this.navigatorKey});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //close the keypad whenever the user taps on an inactive widget
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: AnimatedBuilder(
          animation: settingsViewModel,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              restorationScopeId: 'app',
              title: 'Kuro Bookkeeping',
              debugShowCheckedModeBanner: false,
              darkTheme: BookKeepTheme.darkTheme,
              themeMode: ThemeMode.system,
              theme: BookKeepTheme.lightTheme,
              initialRoute: BookKeepRoute.signUp,
              onGenerateRoute: (RouteSettings settings) {
                return BookKeepRoute.fadeThrough(settings, (context) {
                  switch (settings.name) {
                    case BookKeepRoute.main:
                      return const Home();
                    case BookKeepRoute.signUp:
                      return const SignUp();
                    case BookKeepRoute.login:
                      return const Login();
                    case BookKeepRoute.settings:
                      return SettingsView(
                        viewModel: settingsViewModel,
                        navigatorKey: navigatorKey,
                      );
                    default:
                      return const Login();
                  }
                });
              },
            );
          }),
    );
  }
}

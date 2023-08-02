import 'package:bookkeep_app/src/features/authentication/views/auth/auth.dart';
import 'package:bookkeep_app/src/services/local_storage.dart';
import 'package:bookkeep_app/src/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/features/settings/models/settings_models.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  var firstTime = await LocalStorage.instance.getFirstTime();
  runApp(ProviderScope(
    child: MyApp(
      firstTime: firstTime,
      navigatorKey: navigatorKey,
    ),
  ));
}

// Future initialization(BuildContext? context) async {
//   ///load resources
//   await Future.delayed(Duration(seconds: 3));

// }

class MyApp extends StatefulWidget {
  final bool firstTime;
  final GlobalKey<NavigatorState> navigatorKey;
  const MyApp({super.key, required this.navigatorKey, required this.firstTime});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (context, _) {
            return MaterialApp(
              restorationScopeId: 'app',
              title: 'Kuro Bookkeeping',
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: BookKeepTheme.lightTheme,
              home: const Auth(),
            );
          }),
    );
  }
}

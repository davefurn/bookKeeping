import 'dart:io';

import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

import 'package:bookkeep_app/src/features/book_keeping/views/book_keeping_screen.dart';
import 'package:bookkeep_app/src/features/home/views/home_screen.dart';
import 'package:bookkeep_app/src/features/marketplace/marketplace.dart';
import 'package:bookkeep_app/src/features/more/views/more.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

late BuildContext globalContext;
late CupertinoTabController controller;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  final List<GlobalKey<NavigatorState>> tabNavKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  int currentIndex = 0;

  AppLifecycleState? _lastLifecycleState;
  Timer? _timer;
  int kTimeoutInSeconds = const Duration(minutes: 30).inSeconds;

  @override
  void initState() {
    super.initState();
    globalContext = context;
    controller = CupertinoTabController();
    WidgetsBinding.instance.addObserver(this);
    _lastLifecycleState = WidgetsBinding.instance.lifecycleState;
    _keepAlive(false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (_lastLifecycleState == AppLifecycleState.resumed &&
        state == AppLifecycleState.paused) {
      _keepAlive(true);
    } else if (_lastLifecycleState == AppLifecycleState.paused &&
        state == AppLifecycleState.resumed) {
      _keepAlive(false);
    }

    _lastLifecycleState = state;
  }

  void _keepAlive(bool visible) {
    if (visible) {
      _timer?.cancel();
    } else {
      _timer = Timer(Duration(seconds: kTimeoutInSeconds), () {
        pushToAndClearStack(context, const Login());
        PostRequest.logout();
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            surfaceTintColor: Colors.white,
            contentPadding: EdgeInsets.all(20.r),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            title: Image.asset(
              'assets/images/nothing.png',
              color: const Color(0xff0E5CE3),
              width: 34.r,
              height: 34.r,
            ),
            children: [
              Center(
                child: Text(
                  'Logged out due to inactivity',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tabNavKeys[currentIndex].currentState!.canPop()) {
          tabNavKeys[currentIndex].currentState!.pop();
        } else {
          controller.index = 0;
        }
        return false;
      },
      child: CupertinoTabScaffold(
        controller: controller,
        tabBar: CupertinoTabBar(
          iconSize: 24.sp,
          inactiveColor: BookKeepingColors.tabColor,
          backgroundColor: BookKeepingColors.tabWhite,
          activeColor: BookKeepingColors.mainColor,
          currentIndex: currentIndex,
          onTap: (value) {
            bool? canpop = tabNavKeys[value].currentState?.canPop();
            if (currentIndex == value && canpop == true) {
              tabNavKeys[value]
                  .currentState!
                  .popUntil((route) => route.isFirst);
            }
            currentIndex = value;
          },
          height: Platform.isAndroid ? 60.h : 60.h,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/grid1.png',
                height: 24.h,
                width: 24.w,
                color: BookKeepingColors.tabColor,
              ),
              activeIcon: Image.asset(
                'assets/images/grid.png',
                height: 24.h,
                width: 24.w,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/mdi_book-open-page-variant-outline1.png',
                height: 24.h,
                width: 24.w,
                color: BookKeepingColors.tabColor,
              ),
              activeIcon: Image.asset(
                'assets/images/mdi_book-open-page-variant-outline.png',
                height: 24.h,
                width: 24.w,
              ),
              label: 'Bookkeeping',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/map_grocery-or-supermarket1.png',
                height: 24.h,
                width: 24.w,
                color: BookKeepingColors.tabColor,
              ),
              activeIcon: Image.asset(
                'assets/images/map_grocery-or-supermarket.png',
                height: 24.h,
                width: 24.w,
              ),
              label: 'Marketplace',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ellipsis-horizontal-circle-sharp1.png',
                height: 24.h,
                width: 24.w,
                color: BookKeepingColors.tabColor,
              ),
              activeIcon: Image.asset(
                'assets/images/ellipsis-horizontal-circle-sharp.png',
                height: 24.h,
                width: 24.w,
              ),
              label: 'More',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                navigatorKey: tabNavKeys[0],
                builder: (context) => const CupertinoPageScaffold(
                  child: Home(),
                ),
              );
            case 1:
              return CupertinoTabView(
                navigatorKey: tabNavKeys[1],
                builder: (context) => const CupertinoPageScaffold(
                  child: BookKeeping(),
                ),
              );
            case 2:
              return CupertinoTabView(
                navigatorKey: tabNavKeys[2],
                builder: (context) => const CupertinoPageScaffold(
                  child: MarketPlace(),
                ),
              );
            default:
              return CupertinoTabView(
                navigatorKey: tabNavKeys[3],
                builder: (context) => const CupertinoPageScaffold(
                  child: More(),
                ),
              );
          }
        },
        // bottomNavigationBar: Theme(
        //   data: Theme.of(context).copyWith(
        //     splashColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //   ),
        //   child: BottomNavigationBar(
        //       type: BottomNavigationBarType.fixed,
        //       onTap: (index) {
        //         ref.read(currentIndexProvider.notifier).state = index;
        //         ref.read(tabIndexProvider.notifier).state = index;
        //       },
        //       selectedLabelStyle:
        //           Theme.of(context).textTheme.bodyMedium!.copyWith(
        //                 fontWeight: FontWeight.w600,
        //                 fontSize: 12,
        //               ),
        //       unselectedLabelStyle:
        //           Theme.of(context).textTheme.bodyMedium!.copyWith(
        //                 fontWeight: FontWeight.w400,
        //                 fontSize: 12,
        //               ),
        //       currentIndex: currentIndex,
        //       elevation: 5,
        //       selectedItemColor: IdColors.mainColor,
        //       unselectedItemColor: IdColors.textColorBlack,
        //       backgroundColor: IdColors.backgroundColour,
        //       showSelectedLabels: true,
        //       showUnselectedLabels: true,
        //       items: [
        //         BottomNavigationBarItem(
        //             icon: SvgPicture.asset(
        //               'assets/svgs/home.svg',
        //               color: currentIndex == 0
        //                   ? IdColors.mainColor
        //                   : IdColors.textColorBlack,
        //             ),
        //             label: 'Home'),
        //         BottomNavigationBarItem(
        //             icon: SvgPicture.asset(
        //               'assets/svgs/history.svg',
        //               color: currentIndex == 1
        //                   ? IdColors.mainColor
        //                   : IdColors.textColorBlack,
        //             ),
        //             label: 'History'),
        //         BottomNavigationBarItem(
        //             icon: SvgPicture.asset(
        //               'assets/svgs/notification.svg',
        //               color: currentIndex == 2
        //                   ? IdColors.mainColor
        //                   : IdColors.textColorBlack,
        //             ),
        //             label: 'Notifications'),
        //         BottomNavigationBarItem(
        //             icon: SvgPicture.asset(
        //               'assets/svgs/settingsApp.svg',
        //               color: currentIndex == 3
        //                   ? IdColors.mainColor
        //                   : IdColors.textColorBlack,
        //             ),
        //             label: 'Settings'),
        //       ]),
        // ),
      ),
    );
  }
}

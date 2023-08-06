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
import 'package:bookkeep_app/src/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookkeep_app/src/extension/box_exten.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  String name = '';
  String income = '';
  String expenditure = '';
  bool isCustomer = false;
  bool isServiceProvider = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      LocalStorage.instance.getUserData().then((value) {
        name = '${value.firstName.toUpperCase()} ';
        income = double.parse(value.walletBalance).toStringAsFixed(2);
        expenditure = double.parse(value.walletBalance).toStringAsFixed(2);
        isCustomer = value.isCustomer;
        isServiceProvider = value.isServiceProvider;
       
        // accessLevel = AccessLevel.demo;
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: BookKeepingColors.mainColor,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 25.h),
              decoration: BoxDecoration(
                color: BookKeepingColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              child: Column(
                children: [
                  65.91.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isServiceProvider ?
                          const Text(
                            'Welcome back Service Provider, ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: BookKeepingColors.backgroundColour,
                            ),
                          )
                          :
                        const  Text(
                            'Welcome back, ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: BookKeepingColors.backgroundColour,
                            ),
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: BookKeepingColors.backgroundColour,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 7.w,
                              bottom: 7.h,
                              right: 6.w,
                              top: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: BookKeepingColors.backgroundColour,
                              borderRadius: BorderRadius.circular(7.9.r),
                            ),
                            child: Icon(
                              Icons.notifications,
                              size: 24.sp,
                              color: BookKeepingColors.mainColor,
                            ),
                          ),
                          15.sbW,
                          Container(
                            padding: EdgeInsets.only(
                              left: 7.w,
                              bottom: 7.h,
                              right: 6.w,
                              top: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: BookKeepingColors.backgroundColour,
                              borderRadius: BorderRadius.circular(7.9.r),
                            ),
                            child: Icon(
                              Icons.account_circle,
                              size: 24.sp,
                              color: BookKeepingColors.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  26.sbH,
                  Container(
                    height: 88.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: BookKeepingColors.backgroundColour,
                        borderRadius: BorderRadius.circular(10.r)),
                    margin: EdgeInsets.only(
                      bottom: 28.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total income',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: BookKeepingColors.green,
                              ),
                            ),
                            4.sbH,
                            Text(
                              'NGN $income',
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            2.sbH
                          ],
                        ),
                        VerticalDivider(
                          width: 57.h,
                          color: BookKeepingColors.dividerColor,
                          thickness: 1,
                          endIndent: 17.h,
                          indent: 17.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Expenses',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: BookKeepingColors.failureColor,
                              ),
                            ),
                            4.sbH,
                            Text(
                              'NGN $expenditure',
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            2.sbH
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                97.69.sbH,
                Image.asset(
                  'assets/images/nothing.png',
                  width: 140.625.w,
                  height: 140.625.h,
                  color: BookKeepingColors.tabColor,
                ),
                23.69.sbH,
                Text(
                  'Oops! Nothing to show for now',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: BookKeepingColors.secondaryColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

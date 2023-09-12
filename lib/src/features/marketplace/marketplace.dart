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
import 'package:bookkeep_app/src/extension/box_exten.dart';
import 'package:bookkeep_app/src/features/marketplace/accounting/views/accounting_view.dart';
import 'package:bookkeep_app/src/features/marketplace/data/view/data.dart';
import 'package:bookkeep_app/src/features/marketplace/law/view/law.dart';
import 'package:bookkeep_app/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: BookKeepingColors.backgroundColour,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BookKeepingColors.secondaryColor,
        title: Text(
          'Marketplace',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: BookKeepingColors.backgroundColour,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: BookKeepingColors.backgroundColour,
              ))
        ],
      ),
      body: Column(
        children: [
          18.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: double.maxFinite,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff000D0E), Color(0xff004346)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  24.sbH,
                  Text(
                    'Wallet Balance',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: BookKeepingColors.backgroundColour,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  8.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        isVisible ? 'NGN 200,000.00' : '***************',
                        style: TextStyle(
                          fontSize: 32.sp,
                          color: BookKeepingColors.backgroundColour,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      8.sbW,
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            size: 24.sp,
                            color: BookKeepingColors.backgroundColour,
                          ))
                    ],
                  ),
                  18.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 40.h,
                        width: 146.w,
                        decoration: BoxDecoration(
                          color: BookKeepingColors.backgroundColour,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Center(
                          child: Text(
                            'Transcation History',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: BookKeepingColors.secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      20.sbW,
                      Container(
                        height: 40.h,
                        width: 146.w,
                        decoration: BoxDecoration(
                          color: BookKeepingColors.backgroundColour,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                         child: Center(
                          child: Text(
                            'Withdraw Funds',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: BookKeepingColors.secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 500.h,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<IconData> pagesIcons = const [
                    Icons.money,
                    Icons.balance_outlined,
                    Icons.data_exploration,
                  ];
                  List<String> pageDescription = const [
                    'Tax Filling, Simple Book-Keeping, Financial Anaylst...',
                    'Legal Advice, Draft Lawsuit, Legal Complaints...',
                    'Date Analyst, Business Analyst, Data Admin...',
                  ];
                  List<String> pagesTitle = const [
                    'Accounting',
                    'Law',
                    'Data',
                  ];
                  List<Widget> pages = const [
                    AccountingView(),
                    LawView(),
                    DataView()
                  ];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: ListTile(
                      subtitle: Text(
                        pageDescription[index],
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: BookKeepingColors.secondaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 32.r,
                        backgroundColor: BookKeepingColors.mainColor,
                        child: Icon(
                          pagesIcons[index],
                          size: 32,
                          color: BookKeepingColors.backgroundColour,
                        ),
                      ),
                      title: Text(
                        pagesTitle[index],
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: BookKeepingColors.secondaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      tileColor: const Color(0xffFBFBFB),
                      onTap: () {
                        pushTo(context, pages[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

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
import 'package:bookkeep_app/src/features/marketplace/views/accounting_view.dart';
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
          32.sbH,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              height: 500.h,
              child: GridView.count(
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 15.h,
                crossAxisCount: 2,
                children: [
                  GridViewP(
                    icon: Icons.money,
                    onpressed: () {
                      pushTo(context, const AccountingView());
                    },
                    text: "Accounting",
                  ),
                  GridViewP(
                    icon: Icons.balance_outlined,
                    onpressed: () {},
                    text: "Law",
                  ),
                  GridViewP(
                    icon: Icons.data_exploration,
                    onpressed: () {},
                    text: "Data",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GridViewP extends StatelessWidget {
  final VoidCallback onpressed;
  final IconData icon;
  final String text;
  const GridViewP({
    super.key,
    required this.onpressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: 185.w,
        height: 162.h,
        color: BookKeepingColors.onboardingWhiteColour,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32.r,
              backgroundColor: BookKeepingColors.mainColor,
              child: Icon(
                icon,
                size: 32,
                color: BookKeepingColors.backgroundColour,
              ),
            ),
            16.sbH,
            Text(
              text,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: BookKeepingColors.secondaryColor,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

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

import 'package:bookkeep_app/src/extension/box_exten.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';

class OrdersMarket extends StatefulWidget {
  const OrdersMarket({super.key});

  @override
  State<OrdersMarket> createState() => _OrdersMarketState();
}

class _OrdersMarketState extends State<OrdersMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BookKeepingColors.secondaryColor,
        iconTheme:
            const IconThemeData(color: BookKeepingColors.backgroundColour),
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: BookKeepingColors.backgroundColour,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.sbH,
            Container(
              height: 159.h,
              decoration: BoxDecoration(
                color: BookKeepingColors.onboardingWhiteColour,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 21.h,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.asset(
                        'assets/images/sample_image.png',
                        height: 116.h,
                        width: 116.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  14.sbW,
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lorem Ipsum jfhy yutks gfhug hjfigh bhyfhu hgjryf",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xffEDBF1E),
                            ),
                            7.sbW,
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: BookKeepingColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            24.sbH,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Benefits",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            4.sbH,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: 365.w,
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Blandit lectus cursus maecenas orci ultricies egestas nisi quisque interdum. Condimentum auctor facilisis gravida sit tincidunt nibh id interdum.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            51.sbH,
            Container(
              decoration: BoxDecoration(
                color: BookKeepingColors.onboardingWhiteColour,
                borderRadius: BorderRadius.circular(30.h),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h)
                  .copyWith(bottom: 23.h),
              child: Column(
                children: [
                  Text(
                    "Order Summary",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  25.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "NGN 5,000.00",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  16.sbH,
                  const Divider(
                    color: BookKeepingColors.dividerColor,
                  ),
                  16.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Service  Fee",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "NGN 500.00",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  16.sbH,
                  const Divider(
                    color: BookKeepingColors.dividerColor,
                  ),
                  16.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "VAT Fee",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "NGN 10.00",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  16.sbH,
                  const Divider(
                    color: BookKeepingColors.dividerColor,
                  ),
                  16.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Fee",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "NGN 5,600.00",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                 
                ],
              ),
            ),
             109.sbH,
                  CustomButton(
                    text: 'Proceed',
                    onpressed: () {},
                    thickLine: 1,
                  ),
            23.sbH,
          ],
        ),
      ),
    );
  }
}

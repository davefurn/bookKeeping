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
import 'package:bookkeep_app/src/features/marketplace/views/tax_filing.dart';
import 'package:bookkeep_app/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../widget/tiles.dart';

class AccountingView extends StatelessWidget {
  const AccountingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BookKeepingColors.secondaryColor,
        iconTheme: const IconThemeData(
            color: BookKeepingColors.backgroundColour //change your color here
            ),
        title: Text(
          'Accounting',
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
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            // 20.sbH,
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     'Please kindly choose an option',
            //     style: TextStyle(
            //       fontSize: 16.sp,
            //       fontWeight: FontWeight.w400,
            //       color: BookKeepingColors.secondaryColor,
            //     ),
            //   ),
            // ),
            32.sbH,
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Tiles(
                      onpressed: () {
                        pushTo(
                          context,
                          const TaxFiling(),
                        );
                      },
                      text: 'Tax Filing',
                    ),
                    24.sbH,
                    Tiles(
                      onpressed: () {},
                      text: 'Simple Book-Keeping',
                    ),
                    24.sbH,
                    Tiles(
                      onpressed: () {},
                      text: 'Financial Analyst',
                    ),
                    24.sbH,
                    Tiles(
                      onpressed: () {},
                      text: 'Auditing',
                    ),
                    24.sbH,
                    Tiles(
                      onpressed: () {},
                      text: 'Wealth Manager',
                    ),
                    24.sbH,
                    Tiles(
                      onpressed: () {},
                      text: 'Valuation Expert',
                    ),
                    24.sbH,
                    Tiles(
                      onpressed: () {},
                      text: 'QuickBooks Accounting',
                    ),
                    24.sbH,
                    Tiles(
                      onpressed: () {},
                      text: 'SAGE',
                    ),
                    24.sbH,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

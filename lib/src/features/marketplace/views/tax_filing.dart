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
import 'package:bookkeep_app/src/features/marketplace/views/further_page.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/card.dart';
import 'package:bookkeep_app/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class TaxFiling extends StatefulWidget {
  const TaxFiling({Key? key}) : super(key: key);

  @override
  State<TaxFiling> createState() => _TaxFilingState();
}

class _TaxFilingState extends State<TaxFiling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BookKeepingColors.secondaryColor,
        iconTheme:
            const IconThemeData(color: BookKeepingColors.backgroundColour),
        title: Text(
          'Tax Filing',
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
              Icons.menu_rounded,
              color: BookKeepingColors.backgroundColour,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          20.sbH,
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Available listings for you',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: BookKeepingColors.secondaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  pushTo(context,  FurtherPage(index: index,));
                },
                child: Cards(
                  index: index,
                  description:
                      'sads dfwefrge ergeg ergegr   ghfyv jhgfb hgfgftr gytfyjhbjbe egegerxsdjbc ',
                  image: 'assets/images/sample_image.png',
                  price: '₦50,000.00',
                  rating: '4.5',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

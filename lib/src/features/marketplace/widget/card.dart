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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class Cards extends StatelessWidget {
  final String description;
  final String image;
  final String price;
  final String rating;
  final int index;
  const Cards({
    super.key,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148.h,
      decoration: BoxDecoration(
        color: BookKeepingColors.onboardingWhiteColour,
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.only(
        top: 20.h,
        right: 20.w,
        left: 20.w,
      ),
      padding: EdgeInsets.only(left: 15.w, top: 16.h, bottom: 16.h, right: 13.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Hero(
                tag: index,
                child: Image.asset(
                  image,
                  height: 116.h,
                  width: 116.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          14.sbW,
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: BookKeepingColors.secondaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.favorite, color: BookKeepingColors.mainColor,)),
                      )
                    ],
                  ),
                ),
                37.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: BookKeepingColors.secondaryColor,
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
                          rating,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: BookKeepingColors.secondaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

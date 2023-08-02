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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class SpecialButton2 extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? selectedTextColor;
  final Widget? icon;
  final double? height;
  final double? width;
  final void Function()? onTap;
  const SpecialButton2({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.selectedTextColor,
    this.icon,
    this.onTap,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? BookKeepingColors.subColor),
          color: backgroundColor ?? BookKeepingColors.backgroundColour,
          borderRadius: BorderRadius.circular(4.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
        // alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Row(
                children: [
                  icon!,
                  6.sbW,
                ],
              ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: textColor ?? selectedTextColor ?? BookKeepingColors.subColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

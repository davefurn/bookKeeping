import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class SmallTexts extends StatelessWidget {
  final String lessBold;
  final String bigBold;
  const SmallTexts({
    super.key,
    required this.lessBold,
    required this.bigBold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lessBold,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: BookKeepingColors.secondaryColor,
          ),
        ),
        Text(
          bigBold,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: BookKeepingColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}

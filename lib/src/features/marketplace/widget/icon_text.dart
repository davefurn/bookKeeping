import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String topString;
  final String bottomString;
  const IconAndText({
    super.key,
    required this.icon,
    required this.topString,
    required this.bottomString,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            icon,
            size: 20.sp,
            color: BookKeepingColors.mainColor,
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topString,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(bottomString,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
        )
      ],
    );
  }
}

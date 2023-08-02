import 'package:bookkeep_app/src/features/marketplace/accounting/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class TilesLaw extends StatelessWidget {
  // final AllAcountingIndustriesModel? allAcountingIndustriesModel;
  final AllAcountingIndustriesModel? allAcountingIndustriesModel;
  final VoidCallback onpressed;

  const TilesLaw({
    super.key,
    required this.onpressed,
   required this.allAcountingIndustriesModel,
    // this.allAcountingIndustriesModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpressed,
      title: Text(
        allAcountingIndustriesModel!.name.toString(),
        // allAcountingIndustriesModel!.name.toString(),
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: BookKeepingColors.secondaryColor,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          color: Color(0xffBCC2CC),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: BookKeepingColors.secondaryColor,
      ),
    );
  }
}

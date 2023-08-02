import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/colors.dart';
import '../extension/size_config.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.ref,
    required this.currentIndex,
    required this.indexChange,
    required this.ontap,
    required this.text,
  }) : super(key: key);

  final WidgetRef ref;
  final int currentIndex;
  final int indexChange;
  final VoidCallback ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: getProportionateScreenHeight(72),
        width: getProportionateScreenWidth(390),
        decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: currentIndex == indexChange
                  ? BookKeepingColors.mainColor
                  : BookKeepingColors.subColor),
        ),
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(10),
            right: getProportionateScreenWidth(27)),
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                  ),
            ),
            Container(
              width: getProportionateScreenWidth(18),
              height: getProportionateScreenHeight(18),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: BookKeepingColors.secondaryColor,
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: currentIndex == indexChange
                          ? const AssetImage('assets/images/icon_good.png')
                          : const AssetImage(
                              'assets/images/icon_not_clicked.png'))),
            ),
          ],
        ),
      ),
    );
  }
}

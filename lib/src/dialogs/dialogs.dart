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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extension/size_config.dart';


class Snackingbar extends StatelessWidget {
  final String text;

  final List<Color> colors;
  final Color colorBorder;
  final Color iconColor;
  final Color textColor;
  final String icon;
  const Snackingbar({
    Key? key,
    required this.text,
    required this.colors,
    required this.colorBorder,
    required this.iconColor,
    required this.textColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: colorBorder,
          ),
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.center,
            colors: colors,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(15),
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: getProportionateScreenWidth(5),
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FailureSnackBar extends StatelessWidget {
  const FailureSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: Snackingbar(
        icon: "assets/svg/Vector (5).svg",
        text: 'Error',
        colors: [
          const Color(0xffDD3333).withOpacity(.50),
          const Color(0xffFD0707).withOpacity(.12),
        ],
        colorBorder: const Color(0xffDD3333).withOpacity(.50),
        iconColor: const Color(0xffDD3333),
        textColor: const Color(0xffDD3333),
      ),
    );
  }
}

class SuccessSnackBar extends StatelessWidget {
  const SuccessSnackBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: Snackingbar(
        icon: "assets/svg/Vector (4).svg",
        text: 'Successful',
        colorBorder: const Color(0xff16A34A).withOpacity(.70),
        colors: [
          const Color(0xff00FF5E).withOpacity(.13),
          const Color(0xff16A34A).withOpacity(.49)
        ],
        iconColor: const Color(0xff11833B),
        textColor: const Color(0xff11833B),
      ),
    );
  }
}

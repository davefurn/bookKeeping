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

import '../../../../../constants/colors.dart';
import '../../../../../extension/size_config.dart';

class ScrollFunction extends StatelessWidget {
  final Color color2;
  final Color color3;

  const ScrollFunction({
    Key? key,  this.color2 = BookKeepingColors.subColor,  this.color3  = BookKeepingColors.subColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: BookKeepingColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          height: getProportionateScreenHeight(3),
          width: getProportionateScreenWidth(70),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        Container(
          decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.circular(15),
          ),
          height: getProportionateScreenHeight(3),
          width: getProportionateScreenWidth(70),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        Container(
          decoration: BoxDecoration(
            color: color3,
            borderRadius: BorderRadius.circular(15),
          ),
          height: getProportionateScreenHeight(3),
          width: getProportionateScreenWidth(70),
        )
      ],
    );
  }
}

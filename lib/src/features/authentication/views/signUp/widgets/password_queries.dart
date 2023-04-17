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

import 'package:bookkeep_app/src/extension/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordQueries extends StatelessWidget {
  const PasswordQueries({
    Key? key,
    required this.color, required this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: getProportionateScreenWidth(20.87)),
      child: Row(
        children: [
          SvgPicture.asset("assets/svgs/Vector (10).svg", color: color, width: getProportionateScreenWidth(16.25), height: getProportionateScreenHeight(16.25),),
          SizedBox(width: getProportionateScreenWidth(9.88),),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                ),
          )
        ],
      ),
    );
  }
}

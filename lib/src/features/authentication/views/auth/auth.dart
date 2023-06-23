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
import 'package:bookkeep_app/src/extension/size_config.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/login_service.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/custom_button.dart';
import 'package:bookkeep_app/src/router/app_routes.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: BookKeepingColors.mainColor,
      body: Column(
        children: [
          Container(
            height: getProportionateScreenHeight(361),
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/onbaording1.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            height: getProportionateScreenHeight(571),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: BookKeepingColors.onboardingWhiteColour,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(148),
                    right: getProportionateScreenWidth(149),
                    top: getProportionateScreenHeight(41),
                  ),
                  child: Image.asset(
                    'assets/images/onboarding_icon.png',
                    width: getProportionateScreenWidth(132),
                    height: getProportionateScreenHeight(101.52),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(198.48),
                ),
                CustomButton(
                  text: 'Continue as Service Provider',
                  onpressed: () {
                     pushTo(context, const LoginService());
                  },
                  thickLine: 1,
                  textcolor: BookKeepingColors.backgroundColour,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(26),
                ),
                CustomButton(
                  text: 'Continue as a user',
                  onpressed: () {
                    pushTo(context, const Login());
                  },
                  thickLine: 1,
                  borderColor: BookKeepingColors.mainColor,
                  color: BookKeepingColors.onboardingWhiteColour,
                  textcolor: BookKeepingColors.mainColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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

import 'package:bookkeep_app/src/features/authentication/models/user_data.dart';

import 'package:bookkeep_app/src/features/authentication/views/login/widgets/title.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/personal_infromation.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/pin_code.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/security_password.dart';

import 'package:flutter/material.dart';

import '../../../../extension/size_config.dart';

import '../../../../router/app_routes.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final userModel = UserModel();
  final controller = PageController(initialPage: 0);

  bool submitted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(58.25),
                left: getProportionateScreenWidth(25),
              ),
              child: backButton(context),
            ),
            TitleWidget(
              text: 'Create an Account',
              pDtop: getProportionateScreenHeight(30.25),
              pDleft: getProportionateScreenWidth(25),
              fontSize: 32,
            ),
            SizedBox(
              height: getProportionateScreenHeight(8),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: getProportionateScreenWidth(53),
                left: getProportionateScreenWidth(25),
              ),
              child: Text(
                "Kindly enter required details to get access to account",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(32),
            ),
            SizedBox(
              height: getProportionateScreenHeight(730),
              width: double.maxFinite,
              child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PersonalInformation(
                    controller: controller,
                    userModel: userModel,
                  ),
                  SecurityPassword(
                    controller: controller,
                    usermodel: userModel,
                  ),
                  PinCode(
                    usermodel: userModel,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

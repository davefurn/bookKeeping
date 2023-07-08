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

import 'dart:async';

import 'package:bookkeep_app/src/extension/string_extension.dart';
import 'package:bookkeep_app/src/features/authentication/models/user_data.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/widgets/loading_button.dart';
import 'package:bookkeep_app/src/services/post_requests.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bookkeep_app/src/extension/size_config.dart';

import 'package:bookkeep_app/src/features/authentication/views/signUp/widgets/scroll_function.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/widgets/topic_scroll.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constants/colors.dart';
import '../../../../router/app_routes.dart';
import '../login/login.dart';

import '../login/widgets/smal_text_under_button.dart';

class PinCode extends StatefulWidget {
  final UserModel usermodel;
  const PinCode({
    super.key,
    required this.usermodel,
  });

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  late TextEditingController otpController;
  late TextEditingController confirmOtpController;
  late StreamController<ErrorAnimationType> errorController;
  late StreamController<ErrorAnimationType> errorController2;
  bool hasError = false;
  bool hasError2 = false;
  String currentText = "";
  var state = LoadingState.normal;
  String currentText2 = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    errorController2 = StreamController<ErrorAnimationType>();

    otpController = TextEditingController();
    confirmOtpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    errorController2.close();
    errorController.close();
    super.dispose();
  }

  Future<void> createAccount() async {
    setState(() {
      state = LoadingState.loading;
    });
    await PostRequest.createUser(
      context,
      email: widget.usermodel.email,
      password: widget.usermodel.password,
      firstName: widget.usermodel.firstName,
      lastname: widget.usermodel.lastName,
      phoneNumber: widget.usermodel.phone,
      dateOfBirth: null,
      residencAddress: '',
      stateOfResidence: '',
      localGovernmentArea: '',
      gender: '',
      securityPin: otpController.text.trim(),
    );
    setState(() {
      state = LoadingState.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        const ScrollFunction(
          color2: BookKeepingColors.mainColor,
          color3: BookKeepingColors.mainColor,
        ),
        SizedBox(
          height:32.h,
        ),
        const TopicScroll(
          text: "Security Pin",
        ),
        SizedBox(
          height:32.h,
        ),
        Text(
          "Kindly enter your 4 secured security pin",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
              ),
        ),
        SizedBox(
          height:20.h,
        ),
        pinKeys(context),
        SizedBox(
          height: 53.h,
        ),
        Text(
          "Confirm Pin",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
              ),
        ),
        SizedBox(
          height:20.h,
        ),
        Form(
          key: formKey4,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical:20.h,
                  horizontal: 97.w),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                obscureText: false,
                obscuringCharacter: '*',
                animationType: AnimationType.fade,
                // validator: (v) {
                //   if (v != otpController.text) {
                //     return "Pin Not Similar";
                //   } else {
                //     return null;
                //   }
                // },
                pinTheme: PinTheme(
                  inactiveColor: BookKeepingColors.subColor,
                  errorBorderColor: BookKeepingColors.failureColor,
                  activeColor: BookKeepingColors.mainColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: getProportionateScreenHeight(48),
                  fieldWidth: getProportionateScreenWidth(48),
                  activeFillColor: hasError ? Colors.orange : Colors.white,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                textStyle: const TextStyle(
                    fontFamily: "Livvic", fontSize: 20, height: 1.6),
                backgroundColor: BookKeepingColors.backgroundColour,
                enableActiveFill: false,
                errorAnimationController: errorController2,
                controller: confirmOtpController,
                keyboardType: TextInputType.number,

                onCompleted: (v) {
                  if (kDebugMode) {
                    print("Completed");
                  }
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                  setState(() {
                    currentText2 = value;
                  });
                },
                beforeTextPaste: (text) {
                  if (kDebugMode) {
                    print("Allowing to paste $text");
                  }
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              )),
        ),
        LoadingButton(
            state: state,
            onTap: () {
              formKey3.currentState!.validate();
              // conditions for validating
              if (otpController.text != confirmOtpController.text) {
                errorController.add(ErrorAnimationType
                    .shake); // Triggering error shake animation
                errorController2.add(ErrorAnimationType.shake);
                setState(() {
                  hasError2 = true;
                });
              } else {
                setState(() {
                  hasError2 = false;
                  createAccount();
                });
              }
            },
            text: 'Finish Setup'),
        SizedBox(height: 42.h),
        OnClickToNewPage(
          text1: 'Already have an account?',
          onTap: () {
            pushTo(context, const Login());
          },
          text2: 'Sign In',
        ),
      ],
    );
  }

  Form pinKeys(BuildContext context) {
    return Form(
      key: formKey3,
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical:20.h,
              horizontal:97.w),
          child: PinCodeTextField(
            appContext: context,
            pastedTextStyle: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.bold,
            ),
            length: 4,
            obscureText: false,
            obscuringCharacter: '*',
            animationType: AnimationType.fade,
            // validator: (v) {
            //   if (v!.length < 3) {
            //     return "I'm from validator";
            //   } else {
            //     return null;
            //   }
            // },
            pinTheme: PinTheme(
              inactiveColor: BookKeepingColors.subColor,
              errorBorderColor: BookKeepingColors.failureColor,
              activeColor: BookKeepingColors.mainColor,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 48.h,
              fieldWidth:48.w,
              activeFillColor: hasError ? Colors.orange : Colors.white,
            ),
            cursorColor: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            textStyle: const TextStyle(
                fontFamily: "Livvic", fontSize: 20, height: 1.6),
            backgroundColor: BookKeepingColors.backgroundColour,
            enableActiveFill: false,
            errorAnimationController: errorController,
            controller: otpController,
            keyboardType: TextInputType.number,

            onCompleted: (v) {
              if (kDebugMode) {
                print("Completed");
              }
            },
            // onTap: () {
            //   print("Pressed");
            // },
            onChanged: (value) {
              if (kDebugMode) {
                print(value);
              }
              setState(() {
                currentText = value;
              });
            },
            beforeTextPaste: (text) {
              if (kDebugMode) {
                print("Allowing to paste $text");
              }
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          )),
    );
  }
}

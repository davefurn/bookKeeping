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

import 'package:bookkeep_app/src/features/authentication/views/login/login.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/title.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/widgets/password_queries.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/widgets/scroll_function.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/widgets/topic_scroll.dart';
import 'package:bookkeep_app/src/widgets/space_btwn_text_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../constants/colors.dart';
import '../../../../extension/size_config.dart';
import '../../../../extension/string_extension.dart';
import '../../../../router/app_routes.dart';
import '../login/widgets/custom_button.dart';
import '../login/widgets/custom_text_input.dart';
import '../login/widgets/smal_text_under_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool colorQuery1 = false;
  bool colorQuery2 = false;
  bool colorQuery3 = false;
  bool colorQuery4 = false;

  bool isVisible1 = false;
  bool isVisible2 = false;
  bool hasError = false;
  bool hasError2 = false;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;
  String? confirmPassword;
  String currentText = "";
  String currentText2 = "";

  final List<String?> errors = [];
  final controller = PageController(initialPage: 0);
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> errorController;
  late StreamController<ErrorAnimationType> errorController2;

  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController otpController;
  late TextEditingController confirmOtpController;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    errorController2 = StreamController<ErrorAnimationType>();
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void addRegError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        colorQuery1 = true;
        colorQuery2 = true;
        colorQuery3 = true;
        colorQuery4 = true;
        errors.remove(error);
      });
    }
  }

  void removeRegError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        colorQuery1 = true;
        colorQuery2 = true;
        colorQuery3 = true;
        colorQuery4 = true;
        errors.add(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                personalInformation(context),
                SizedBox(
                  child: Form(
                    key: formKey2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(25),
                        ),
                        const ScrollFunction(
                          color2: BookKeepingColors.mainColor,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(32),
                        ),
                        const TopicScroll(
                          text: "Security and Passowrd",
                        ),
                        const TextInputSpace(),
                        CustomTextInput(
                          onSaved: (newValue) => password = newValue,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kPassNullError);
                            } else if (value.length >= 8) {
                              removeError(error: kShortPassError);
                            } else if (passWordalidatorExp.hasMatch(value)) {
                              removeError(error: kPassNull2Error);
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: kPassNullError);
                              return "Please Enter your password";
                            } else if (value.length < 8) {
                              addError(error: kShortPassError);
                              return "Password is too short";
                            } else if (!passWordalidatorExp.hasMatch(value)) {
                              addError(error: kPassNull2Error);
                              return "Atleast a capital, small letter, special character, and digit are needed";
                            }
                            return null;
                          },
                          enableSuggestions: false,
                         
                          textInputAction: TextInputAction.next,
                          expands: false,
                          obscureText: isVisible1 ? false : true,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Password',
                          controller: passwordController,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: BookKeepingColors.secondaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible1 = !isVisible1;
                              });
                            },
                          ),
                        ),
                        const TextInputSpace(),
                        PasswordQueries(
                          color: colorQuery1
                              ? BookKeepingColors.secondaryColor
                              : BookKeepingColors.mainColor,
                          text: "Password should contain uppercase",
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(18),
                        ),
                        PasswordQueries(
                          color: colorQuery2
                              ? BookKeepingColors.secondaryColor
                              : BookKeepingColors.mainColor,
                          text: "Password should contain lowercase",
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(18),
                        ),
                        PasswordQueries(
                          color: colorQuery3
                              ? BookKeepingColors.secondaryColor
                              : BookKeepingColors.mainColor,
                          text: "Password should contain digits",
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(18),
                        ),
                        PasswordQueries(
                          color: colorQuery4
                              ? BookKeepingColors.secondaryColor
                              : BookKeepingColors.mainColor,
                          text: "Password should contain special character",
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(18),
                        ),
                        const TextInputSpace(),
                        CustomTextInput(
                          onSaved: (newValue) => confirmPassword = newValue,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kPassNullError);
                            } else if (value.length >= 8) {
                              removeError(error: kShortPassError);
                            } else if (passWordalidatorExp.hasMatch(value)) {
                              removeError(error: kPassNull2Error);
                            } else if (value == passwordController.text) {
                              removeError(error: confirmPassword);
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              addError(error: kPassNullError);
                              return "Please Enter your password";
                            } else if (value.length < 8) {
                              addError(error: kShortPassError);
                              return "Password is too short";
                            } else if (!passWordalidatorExp.hasMatch(value)) {
                              addError(error: kPassNull2Error);
                              return "Atleast a capital, small letter, special character, and digit are needed";
                            } else if (value != passwordController.text) {
                              addError(error: confirmPassword);
                              return "Password not similar";
                            }
                            return null;
                          },
                          enableSuggestions: false,
                         
                          textInputAction: TextInputAction.done,
                          expands: false,
                          obscureText: isVisible2 ? false : true,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: 'Confirm Password',
                          controller: confirmPasswordController,
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: BookKeepingColors.secondaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible2 = !isVisible2;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(72),
                        ),
                        CustomButton(
                          color: BookKeepingColors.mainColor,
                          thickLine: 1,
                          onpressed: () async {
                            if (formKey2.currentState!.validate()) {
                              formKey2.currentState!.save();

                              controller.nextPage(
                                  duration: const Duration(
                                    milliseconds: 250,
                                  ),
                                  curve: Curves.easeInOut);
                            }
                          },
                          text: 'Next',
                          textcolor: BookKeepingColors.backgroundColour,
                        ),
                        SizedBox(height: getProportionateScreenHeight(42)),
                        OnClickToNewPage(
                          text1: 'Already have an account?',
                          onTap: () {
                            pushTo(context, const Login());
                          },
                          text2: 'Sign In',
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    const ScrollFunction(
                      color2: BookKeepingColors.mainColor,
                      color3: BookKeepingColors.mainColor,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(32),
                    ),
                    const TopicScroll(
                      text: "Security Pin",
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(32),
                    ),
                    Text(
                      "Kindly enter your 4 secured security pin",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    pinKeys(context),
                    SizedBox(
                      height: getProportionateScreenHeight(53),
                    ),
                    Text(
                      "Confirm Pin",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Form(
                      key: formKey4,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(20),
                              horizontal: getProportionateScreenWidth(97)),
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
                              errorBorderColor:
                                  BookKeepingColors.failureColor,
                              activeColor: BookKeepingColors.mainColor,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: getProportionateScreenHeight(48),
                              fieldWidth: getProportionateScreenWidth(48),
                              activeFillColor:
                                  hasError ? Colors.orange : Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            textStyle: const TextStyle(
                                fontFamily: "Livvic",
                                fontSize: 20,
                                height: 1.6),
                            backgroundColor:
                                BookKeepingColors.backgroundColour,
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
                    CustomButton(
                      color: BookKeepingColors.mainColor,
                      thickLine: 1,
                      onpressed: () {
                        formKey3.currentState!.validate();
                        // conditions for validating
                        if (currentText.length != 4 ||
                            otpController.text != confirmOtpController.text) {
                          errorController.add(ErrorAnimationType
                              .shake); // Triggering error shake animation
                          errorController2.add(ErrorAnimationType.shake);
                          setState(() {
                            hasError2 = true;
                          });
                        } else {
                          setState(() {
                            hasError2 = false;
                            pushToAndClearStack(context, const Login());
                          });
                        }
                      },
                      text: 'Finish Setup',
                      textcolor: BookKeepingColors.backgroundColour,
                    ),
                    SizedBox(height: getProportionateScreenHeight(42)),
                    OnClickToNewPage(
                      text1: 'Already have an account?',
                      onTap: () {
                        pushTo(context, const Login());
                      },
                      text2: 'Sign In',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Form pinKeys(BuildContext context) {
    return Form(
      key: formKey3,
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenWidth(97)),
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

  SizedBox personalInformation(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Form(
          key: formKey1,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(25),
              ),
              const ScrollFunction(),
              SizedBox(
                height: getProportionateScreenHeight(32),
              ),
              const TopicScroll(
                text: "Personal Information",
              ),
              const TextInputSpace(),
              CustomTextInput(
                onSaved: (newValue) => firstName = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kNamelNullError);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kNamelNullError);
                    return "Please enter your first name";
                  }
                  return null;
                },
               
                textInputAction: TextInputAction.next,
                hintText: 'First Name',
                keyboardType: TextInputType.name,
                controller: firstNameController,
              ),
              const TextInputSpace(),
              CustomTextInput(
                onSaved: (newValue) => lastName = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kNamelNullError);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kNamelNullError);
                    return "Please enter your Last name";
                  }
                  return null;
                },
              
                textInputAction: TextInputAction.next,
                hintText: 'Last Name',
                keyboardType: TextInputType.name,
                controller: lastNameController,
              ),
              const TextInputSpace(),
              CustomTextInput(
                  onSaved: (newValue) => email = newValue,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kEmailNullError);
                    } else if (emailValidatorRegExp.hasMatch(value)) {
                      removeError(error: kInvalidEmailError);
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kEmailNullError);
                      return "Please Enter your email";
                    } else if (!emailValidatorRegExp.hasMatch(value)) {
                      addError(error: kInvalidEmailError);
                      return "Please Enter Valid Email";
                    }
                    return null;
                  },
                 
                  textInputAction: TextInputAction.next,
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.email,
                      color: BookKeepingColors.secondaryColor,
                    ),
                    onPressed: () {},
                  )),
              const TextInputSpace(),
              CustomTextInput(
                onSaved: (newValue) => phoneNumber = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kPhoneNumberNullError);
                  } else if (phoneRegExp.hasMatch(value)) {
                    removeError(error: kInvalidPhoneNumberError);
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kPhoneNumberNullError);
                    return "Please enter your phone Number";
                  } else if (!phoneRegExp.hasMatch(value)) {
                    addError(error: kInvalidPhoneNumberError);
                    return "Please enter valid phone number";
                  }
                  return null;
                },
               
                textInputAction: TextInputAction.next,
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
                controller: phoneNumberController,
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              CustomButton(
                color: BookKeepingColors.mainColor,
                thickLine: 1,
                onpressed: () async {
                  if (formKey1.currentState!.validate()) {
                    formKey1.currentState!.save();
                    controller.nextPage(
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        curve: Curves.easeInOut);
                  }
                },
                text: 'Next',
                textcolor: BookKeepingColors.backgroundColour,
              ),
              SizedBox(height: getProportionateScreenHeight(42)),
              OnClickToNewPage(
                text1: 'Already have an account?',
                onTap: () {
                  pushTo(context, const Login());
                },
                text2: 'Sign In',
              ),
            ],
          ),
        ),
      ),
   
    );
  }
}

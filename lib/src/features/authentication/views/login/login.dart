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
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/custom_button.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/custom_text_input.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/smal_text_under_button.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/title.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/sign_up.dart';
import 'package:bookkeep_app/src/router/app_routes.dart';
import 'package:bookkeep_app/src/router/router.dart';
import 'package:flutter/material.dart';

import '../../../../dialogs/dialogs.dart';
import '../../../../extension/string_extension.dart';
import '../../../../extension/size_config.dart';
import '../../../home/views/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = false;
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  final bool _validate = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  void signin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // if all are valid then go to success screen
      final snackBar = SnackBar(
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

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Future.delayed(const Duration(seconds: 1), () {
        pushToAndClearStack(context, const Home());
      });
    } else {
      final snackBar = SnackBar(
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
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(58.25),
                  left: getProportionateScreenWidth(24.69),
                ),
                child: backButton(context),
              ),
              TitleWidget(
                text: 'Log In',
                pDtop:  getProportionateScreenHeight(157.25),
                pDleft: getProportionateScreenWidth(25),
                fontSize: 32,
              ),
              SizedBox(height: getProportionateScreenHeight(8),),
              Padding(
                padding:  EdgeInsets.only(
                  right: getProportionateScreenWidth(53),
                ),
                child: Text(
                  "Kindly enter login details to get access to account",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(87),
              ),
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
                  validate: _validate,
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
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
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
                    return "Enter a valid password";
                  }
                  return null;
                },
                enableSuggestions: false,
                validate: _validate,
                textInputAction: TextInputAction.done,
                expands: false,
                obscureText: isVisible ? false : true,
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Password',
                controller: passwordController,
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: BookKeepingColors.secondaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(148),
              ),
              CustomButton(
                color: BookKeepingColors.mainColor,
                thickLine: 1,
                onpressed: signin,
                text: 'Login',
                textcolor: BookKeepingColors.backgroundColour,
              ),
              SizedBox(height: getProportionateScreenHeight(42)),
              OnClickToNewPage(
                text1: 'Don\'t have an account?',
                onTap: () {
                  pushTo(context, const SignUp());
                },
                text2: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

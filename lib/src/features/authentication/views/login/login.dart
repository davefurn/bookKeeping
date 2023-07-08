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
import 'package:bookkeep_app/src/extension/string_extension.dart';

import 'package:bookkeep_app/src/features/authentication/views/login/widgets/custom_text_input.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/smal_text_under_button.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/title.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/sign_up.dart';
import 'package:bookkeep_app/src/features/authentication/views/signUp/widgets/loading_button.dart';
import 'package:bookkeep_app/src/features/marketplace/views/marketplace.dart';
import 'package:bookkeep_app/src/router/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../extension/size_config.dart';
import '../../../../services/post_requests.dart';
import '../../../../widgets/space_btwn_text_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = false;

  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];

  bool submitted = false;
  var state = LoadingState.normal;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  Future<void> verify() async {
    setState(() {
      state = LoadingState.loading;
    });
    // await PostRequest.fetchBearerToken(
    //   context,
    //   login: true,
    //   email: emailController.text,
    //   password: passwordController.text,
    // );
    pushTo(context,const MarketPlace());
    setState(() {
      state = LoadingState.normal;
    });
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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(58.25),
                  left: getProportionateScreenWidth(20),
                ),
                child: backButton(context),
              ),
              TitleWidget(
                text: 'Log In',
                pDtop: getProportionateScreenHeight(157.25),
                pDleft: getProportionateScreenWidth(20),
                fontSize: 32,
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Kindly enter login details to get access to account",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(87),
              ),
              CustomTextInput(
                  validator: (String? value) {
                    if ((value == null || value.isEmpty) ||
                        !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  autovalidateMode: submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.email,
                      color: BookKeepingColors.secondaryColor,
                    ),
                    onPressed: () {},
                  )),
              const TextInputSpace(),
              CustomTextInput(
                autovalidateMode: submitted
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (v) {
                  if ((v == null || v.isEmpty) ||
                      !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*.:;+=-?&])[A-Za-z\d@$!%*.?&]{8,}$')
                          .hasMatch(v)) {
                    return 'Please enter a password';
                  } else if (v.length < 6) {
                    return 'The password is too short';
                  }
                  return null;
                },
                enableSuggestions: false,
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
              LoadingButton(
                  state: state,
                  onTap: () {
                    setState(() => submitted = true);
                    if (_formKey.currentState!.validate()) {
                      verify();
                    }
                  },
                  text: 'Login'),
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

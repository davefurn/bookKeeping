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

import 'package:bookkeep_app/src/features/Business_registration/model/business_reg_model.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class SecurityPasswordBusiness extends StatefulWidget {
  final PageController controller;

  final BusinessModel businessModel;

  const SecurityPasswordBusiness({
    super.key,
    required this.controller,
    required this.businessModel,
  });

  @override
  State<SecurityPasswordBusiness> createState() =>
      _SecurityPasswordBusinessState();
}

class _SecurityPasswordBusinessState extends State<SecurityPasswordBusiness> {
  final formKey2 = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final String checkAll =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  final String checkSpecial = r'^(?=.*?[!@#\$&*~])';
  final String checkLetters = r'^(?=.*?[A-Z])(?=.*?[a-z])';
  final String checkNumbers = r'^(?=.*?[0-9])';
  bool isVisible2 = false;

  bool submitted = false;
  bool isVisible1 = false;

  var state = LoadingState.normal;

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: formKey2,
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            const ScrollFunction(
              color2: BookKeepingColors.mainColor,
            ),
            SizedBox(
              height: 32.h,
            ),
            const TopicScroll(
              text: "Security and Passowrd",
            ),
            const TextInputSpace(),
            CustomTextInput(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter your password";
                } else if (value.length < 8) {
                  return "Password is too short";
                } else if (!passWordalidatorExp.hasMatch(value)) {
                  return "Atleast a capital, small letter, special character, and digit are needed";
                }
                return null;
              },
              enableSuggestions: false,
              autovalidateMode: submitted
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              textInputAction: TextInputAction.next,
              expands: false,
              obscureText: isVisible1 ? false : true,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'Password',
              controller: passwordController,
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible1 ? Icons.visibility : Icons.visibility_off,
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
            CustomTextInput(
              validator: (value) {
                if (value == null || value.isEmpty || value.trim().length < 8) {
                  return 'Password has to be 8 characters or more!';
                } else if (!RegExp(checkLetters).hasMatch(value)) {
                  return 'Password has to contain Uppercase and Lowercase letters!';
                } else if (!RegExp(checkNumbers).hasMatch(value)) {
                  return 'Password has to contain numbers!';
                } else if (!RegExp(checkSpecial).hasMatch(value)) {
                  return 'Password has to contain a special character!';
                } else if (value != passwordController.text) {
                  return "Password not similar";
                }
                return null; // to indicate a success
              },
              enableSuggestions: false,
              textInputAction: TextInputAction.done,
              expands: false,
              autovalidateMode: submitted
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              obscureText: isVisible2 ? false : true,
              keyboardType: TextInputType.visiblePassword,
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible2 ? Icons.visibility : Icons.visibility_off,
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
              height: 72.h,
            ),
            LoadingButton(
                state: state,
                onTap: () async {
                  setState(() => submitted = true);
                  if (formKey2.currentState!.validate() &&
                      passwordController.text ==
                          confirmPasswordController.text) {
                    formKey2.currentState!.save();
                
                    widget.businessModel.password =
                        passwordController.text.trim();
                    widget.controller.nextPage(
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        curve: Curves.easeInOut);
                  }
                },
                text: 'Next'),
            SizedBox(height: 42.h),
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
    );
  }
}

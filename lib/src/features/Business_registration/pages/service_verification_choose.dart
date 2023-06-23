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
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors.dart';
import '../../../extension/size_config.dart';
import '../../../widgets/custom_radio.dart';
import '../../../widgets/space_btwn_text_input.dart';
import '../../authentication/views/login/widgets/custom_button.dart';
import '../../authentication/views/signUp/widgets/scroll_function.dart';
import '../../authentication/views/signUp/widgets/topic_scroll.dart';
import '../controller/controller_bus_reg.dart';

class ServiceVerificationChoose extends StatelessWidget {
  const ServiceVerificationChoose({
    Key? key,
    required this.formKey3,
    required this.ref,
    required this.currentIndex,
 
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey3;
  final WidgetRef ref;
  final int currentIndex;

  final PageController controller;

  @override
  Widget build(BuildContext context) {
 
    return SizedBox(
      child: Form(
        key: formKey3,
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
              text: "Service Verification",
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: const Divider(
                color: Color(0xffEAECF4),
                thickness: 2,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(20)),
                child: Text(
                  'Upload Documents',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(4),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  right: getProportionateScreenWidth(59),
                  left: getProportionateScreenWidth(20),
                ),
                child: Text(
                  "To comply with safety and security measures, we have to verify our service providers.",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(33),
            ),
            CustomRadio(
              ref: ref,
              currentIndex: currentIndex,
              ontap: () {
                ref.read(currentIndexProvider.notifier).state = 0;
              },
              indexChange: 0,
              text: 'National Identification Number',
            ),
            const TextInputSpace(),
            CustomRadio(
              ref: ref,
              currentIndex: currentIndex,
              ontap: () {
                ref.read(currentIndexProvider.notifier).state = 1;
              },
              indexChange: 1,
              text: 'International Passport',
            ),
            const TextInputSpace(),
            CustomRadio(
              ref: ref,
              currentIndex: currentIndex,
              ontap: () {
                ref.read(currentIndexProvider.notifier).state = 2;
              },
              indexChange: 2,
              text: 'Drivers License',
            ),
            const TextInputSpace(),
            CustomRadio(
              ref: ref,
              currentIndex: currentIndex,
              ontap: () {
                
                ref.read(currentIndexProvider.notifier).state = 3;
              },
              indexChange: 3,
              text: 'Others',
            ),
            const TextInputSpace(),
            CustomButton(
              color: BookKeepingColors.mainColor,
              thickLine: 1,
              onpressed: () async {
                if (formKey3.currentState!.validate()) {
                  formKey3.currentState!.save();
                  if (currentIndex == 0) {
                    controller.animateToPage(3,
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        curve: Curves.easeInOut);
                  } else if (currentIndex == 1) {
                     controller.animateToPage(4,
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        curve: Curves.easeInOut);
                  } else if (currentIndex == 2) {
                     controller.animateToPage(5,
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        curve: Curves.easeInOut);
                  } else if (currentIndex == 3) {}
                }
              },
              text: 'Next',
              textcolor: BookKeepingColors.backgroundColour,
            ),
          ],
        ),
      ),
    );
  }
}


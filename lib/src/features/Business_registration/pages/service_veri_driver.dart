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

import '../../../constants/colors.dart';
import '../../../extension/size_config.dart';
import '../../authentication/views/login/widgets/custom_button.dart';
import '../../authentication/views/signUp/widgets/scroll_function.dart';
import '../../authentication/views/signUp/widgets/topic_scroll.dart';
import '../view/business_reg.dart';

class ServiceVerificationDriverLicense extends StatelessWidget {
  const ServiceVerificationDriverLicense({
    Key? key,
    required this.formKey6,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey6;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: formKey6,
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
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    EdgeInsets.only(left: getProportionateScreenWidth(20)),
                child: Text(
                  'Upload Documents',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
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
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(54),
            ),
            const TopicScroll(
              text: "Drivers License",
              size: 16,
            ),
            SizedBox(
              height: getProportionateScreenHeight(42),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  right: getProportionateScreenWidth(59),
                  left: getProportionateScreenWidth(20),
                ),
                child: Text(
                  "Supported formats is .pdf and .docs only. File size shouldnt exceed 5mb",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(16),
            ),
            const CustomUpload(),
            SizedBox(
              height: getProportionateScreenHeight(160),
            ),
            CustomButton(
              color: BookKeepingColors.mainColor,
              thickLine: 1,
              onpressed: () async {
                if (formKey6.currentState!.validate()) {
                  formKey6.currentState!.save();
                  controller.animateToPage(6,
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      curve: Curves.easeInOut);
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

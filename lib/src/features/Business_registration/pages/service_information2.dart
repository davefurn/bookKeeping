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
import '../../../widgets/space_btwn_text_input.dart';
import '../../authentication/views/login/widgets/custom_button.dart';
import '../../authentication/views/login/widgets/custom_text_input.dart';
import '../../authentication/views/signUp/widgets/scroll_function.dart';
import '../../authentication/views/signUp/widgets/topic_scroll.dart';

class ServiceInformationPage2 extends StatelessWidget {
  const ServiceInformationPage2({
    Key? key,
    required this.formKey2,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> formKey2;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Form(
          key: formKey2,
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
                text: "Service Information",
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
                    'Service Location',
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
                    "Kindly tell us where you are offering your services from",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
              const TextInputSpace(),
              CustomTextInput(
                hintText: 'Country',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: BookKeepingColors.secondaryColor,
                    )),
              ),
              const TextInputSpace(),
              CustomTextInput(
                hintText: 'State',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: BookKeepingColors.secondaryColor,
                    )),
              ),
              const TextInputSpace(),
              CustomTextInput(
                hintText: 'City',
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: BookKeepingColors.secondaryColor,
                    )),
              ),
              const TextInputSpace(),
              const CustomTextInput(
                hintText: 'Official Address',
              ),
               const TextInputSpace(),
              const CustomTextInput(
                hintText: 'Postal Code',
              ),
               SizedBox(
                height: getProportionateScreenHeight(84),
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
            ],
          ),
        ),
      ),
    );
  }
}

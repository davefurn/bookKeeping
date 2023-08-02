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
import 'package:bookkeep_app/src/features/Business_registration/pages/pin_code.dart';
import 'package:bookkeep_app/src/features/Business_registration/pages/security_passowrd.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../pages/service_verification_nin.dart';

class BusinessRegistration extends ConsumerStatefulWidget {
  const BusinessRegistration({Key? key}) : super(key: key);

  @override
  ConsumerState<BusinessRegistration> createState() =>
      _BusinessRegistrationState();
}

class _BusinessRegistrationState extends ConsumerState<BusinessRegistration> {
  final businessModel = BusinessModel();

  final controller = PageController(initialPage: 0);

  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();

  final formKey5 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  final formKey8 = GlobalKey<FormState>();
  final formKey9 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final currentIndex = ref.watch(currentIndexProvider);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 58.25.h,
              left: 25.w,
            ),
            child: backButton(context),
          ),
          TitleWidget(
            text: 'Service Registration',
            pDtop: 30.25.h,
            pDleft: 25.w,
            fontSize: 32.sp,
          ),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 53.w,
              left: 26.w,
            ),
            child: Text(
              "Kindly tell us what you do",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
          ),
          32.sbH,
          SizedBox(
            height: 730.h,
            width: double.maxFinite,
            child: PageView(
              controller: controller,
              children: [
                ServiceInformationPage(
                  controller: controller,
                  businessModel: businessModel,
                ),
                ServiceInformationPage2(
                  controller: controller,
                  businessModel: businessModel,
                ),
                // ServiceVerificationChoose(
                //     formKey3: formKey3,
                //     ref: ref,
                //     currentIndex: currentIndex,
                //     controller: controller),
                // ServiceVerificationNIN(
                //     formKey4: formKey4, controller: controller),
                // ServiceVerificationInternation(
                //     formKey5: formKey5, controller: controller),
                // ServiceVerificationDriverLicense(
                //     formKey6: formKey6, controller: controller),
                // ServiceVerifcationChooseImage(controller: controller),
                SecurityPasswordBusiness(
                  controller: controller,
                  businessModel: businessModel,
                ),
                PinCodeBusiness(
                  businessModel: businessModel,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

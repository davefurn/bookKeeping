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
import 'package:bookkeep_app/src/extension/box_exten.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/widgets/custom_button.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/card.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/expandable_text.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/specialbutton.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/sub_text.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/text_in_descrip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/review_card.dart';

class FurtherPage extends StatefulWidget {
  final int index;
  const FurtherPage({super.key, required this.index});

  @override
  State<FurtherPage> createState() => _FurtherPageState();
}

class _FurtherPageState extends State<FurtherPage> {
  int initailVlaue = 0;
  void profileIntricasies() async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.61),
      context: context,
      builder: (_) {
        return Container(
          height: 545.h,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: const BoxDecoration(
            color: BookKeepingColors.backgroundColour,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              26.sbH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              16.sbH,
              const Divider(
                color: BookKeepingColors.dividerColor,
              ),
              16.sbH,
              Text(
                "User Information",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.sbH,
              Text(
                'Lorem ipsum dolor sit amet consectetur. Blandit lectus cursus maecenas orci ultricies egestas nisi quisque interdum. Condimentum auctor facilisis gravida sit tincidunt nibh id interdum.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: BookKeepingColors.secondaryColor,
                ),
              ),
              26.sbH,
              const IconAndText(
                icon: Icons.location_pin,
                bottomString: 'Lagos, Nigeria',
                topString: 'Location',
              ),
              19.sbH,
              const IconAndText(
                icon: Icons.star,
                bottomString: 'Rating',
                topString: 'Location',
              ),
              19.sbH,
              const IconAndText(
                icon: Icons.language,
                bottomString: 'Languages',
                topString: 'English',
              ),
              19.sbH,
              const IconAndText(
                icon: Icons.timelapse,
                bottomString: 'Average Response Time',
                topString: '2 hours',
              ),
              19.sbH,
              const IconAndText(
                icon: Icons.timelapse,
                bottomString: 'Average Response Time',
                topString: '2 hours',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.index,
              child: Image.asset(
                'assets/images/sample_image2.png',
                height: 200.h,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 15.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Augusta William',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: BookKeepingColors.secondaryColor,
                    ),
                  ),
                  SpecialButton2(
                    text: 'View Profile',
                    onTap: profileIntricasies,
                  )
                ],
              ),
            ),
            36.sbH,
            const SubTitle(
              text: 'Service Description',
            ),
            8.sbH,
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
              ),
              child: const Align(
                  alignment: Alignment.topLeft,
                  child: ExpandableText(
                    'Lorem ipsum dolor sit amet consectetur. Blandit lectus cursus maecenas orci ultricies egestas nisi quisque interdum. When a row is in a parent that does not provide a finite width constraint, for example if it is in a horizontal scrollable, it will try to shrink-wrap its children along the horizontal axis. Setting flex on a child (e.g. using Expanded) indicates that the child is to expand to fill the remainingspace in the horizontal direction..',
                    trimLines: 3,
                  )),
            ),
            16.sbH,
            const Divider(
              color: BookKeepingColors.dividerColor,
            ),
            16.sbH,
            const SubTitle(
              text: 'Pricing',
            ),
            16.sbH,
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
                decoration: BoxDecoration(
                    color: BookKeepingColors.onboardingWhiteColour,
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.only(left: 15.w, right: 10.w),
                child: Column(
                  children: [
                    16.sbH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpecialButton2(
                          text: '₦5,000',
                          onTap: () {
                            setState(() {
                              initailVlaue = 0;
                            });
                          },
                          backgroundColor: initailVlaue == 0
                              ? BookKeepingColors.mainColor
                              : BookKeepingColors.onboardingWhiteColour,
                          textColor: initailVlaue == 0
                              ? BookKeepingColors.onboardingWhiteColour
                              : BookKeepingColors.mainColor,
                        ),
                        SpecialButton2(
                          text: '₦10,000',
                          onTap: () {
                            setState(() {
                              initailVlaue = 1;
                            });
                          },
                          backgroundColor: initailVlaue == 1
                              ? BookKeepingColors.mainColor
                              : BookKeepingColors.onboardingWhiteColour,
                          textColor: initailVlaue == 1
                              ? BookKeepingColors.onboardingWhiteColour
                              : BookKeepingColors.mainColor,
                        ),
                        SpecialButton2(
                          text: '₦20,000',
                          onTap: () {
                            setState(() {
                              initailVlaue = 2;
                            });
                          },
                          backgroundColor: initailVlaue == 2
                              ? BookKeepingColors.mainColor
                              : BookKeepingColors.onboardingWhiteColour,
                          textColor: initailVlaue == 2
                              ? BookKeepingColors.onboardingWhiteColour
                              : BookKeepingColors.mainColor,
                        ),
                      ],
                    ),
                    21.sbH,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur. Blandit lectus cursus maecenas orci ultricies egestas nisi quisque interdum. Condimentum auctor facilisis gravida sit tincidunt nibh id interdum.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: BookKeepingColors.secondaryColor,
                        ),
                      ),
                    ),
                    16.sbH,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Benefits',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: BookKeepingColors.secondaryColor,
                        ),
                      ),
                    ),
                    16.sbH,
                    const SmallTexts(
                      lessBold: 'Delivery Period',
                      bigBold: '2 Weeks',
                    ),
                    16.sbH,
                    const Divider(
                      color: BookKeepingColors.dividerColor,
                    ),
                    16.sbH,
                    const SmallTexts(
                      lessBold: 'Revisions',
                      bigBold: '3x',
                    ),
                    16.sbH,
                    const Divider(
                      color: BookKeepingColors.dividerColor,
                    ),
                    16.sbH,
                    const SmallTexts(
                      lessBold: 'Delivery Period',
                      bigBold: '2 Weeks',
                    ),
                    16.sbH,
                    const Divider(
                      color: BookKeepingColors.dividerColor,
                    ),
                    16.sbH,
                    const SmallTexts(
                      lessBold: 'Delivery Period',
                      bigBold: '2 Weeks',
                    ),
                    16.sbH,
                    const Divider(
                      color: BookKeepingColors.dividerColor,
                    ),
                    16.sbH,
                  ],
                ),
              ),
            ),
            32.sbH,
            CustomButton(
              text: 'Proceed',
              onpressed: () {
              
              },
              thickLine: 1,
            ),
            32.sbH,
            const Divider(
              color: BookKeepingColors.dividerColor,
            ),
            16.sbH,
            const SubTitle(text: 'Ratings & Feedbacks'),
            32.sbH,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 56.sp,
                    color: BookKeepingColors.secondaryColor,
                  ),
                  Text(
                    "4.5/5",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "(200 Total Ratings)",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  42.sbH,
                  200.sbH,
                  const SubTitle(text: 'All Feedbacks (30+)'),
                  16.sbH,
                  const ReviewCard(
                    image: 'assets/images/sample_image.png',
                    name: "Omotola Bello",
                    location: "Lagos, Nigeria",
                    description:
                        "Viverra eget aliquet massa morbi sit mattis fermentum tristique at. Volutpat fermentum molestie amet consequat",
                    rating: '4.5',
                    time: "2 months ago",
                  ),
                  24.sbH,
                  const ReviewCard(
                    image: 'assets/images/sample_image.png',
                    name: "Omotola Bello",
                    location: "Lagos, Nigeria",
                    description:
                        "Viverra eget aliquet massa morbi sit mattis fermentum tristique at. Volutpat fermentum molestie amet consequat",
                    rating: '4.5',
                    time: "2 months ago",
                  ),
                  24.sbH,
                  const ReviewCard(
                    image: 'assets/images/sample_image.png',
                    name: "Omotola Bello",
                    location: "Lagos, Nigeria",
                    description:
                        "Viverra eget aliquet massa morbi sit mattis fermentum tristique at. Volutpat fermentum molestie amet consequat",
                    rating: '4.5',
                    time: "2 months ago",
                  ),
                  36.sbH,
                  const SpecialButton2(
                    text: 'See all Feedback',
                    borderColor: Color(0xffEAECF4),
                  ),
                  24.sbH,
                  const Divider(
                    color: BookKeepingColors.dividerColor,
                  ),
                  24.sbH,
                  const SubTitle(text: 'More People to follow'),
                  12.sbH,
                  const Cards(
                    index: 45,
                    description:
                        'sads dfwefrge ergeg ergegr   ghfyv jhgfb hgfgftr gytfyjhbjbe egegerxsdjbc ',
                    image: 'assets/images/sample_image.png',
                    price: '₦50,000.00',
                    rating: '4.5',
                  ),
                  const Cards(
                    index: 46,
                    description:
                        'sads dfwefrge ergeg ergegr   ghfyv jhgfb hgfgftr gytfyjhbjbe egegerxsdjbc ',
                    image: 'assets/images/sample_image.png',
                    price: '₦50,000.00',
                    rating: '4.5',
                  ),
                  const Cards(
                    index: 47,
                    description:
                        'sads dfwefrge ergeg ergegr   ghfyv jhgfb hgfgftr gytfyjhbjbe egegerxsdjbc ',
                    image: 'assets/images/sample_image.png',
                    price: '₦50,000.00',
                    rating: '4.5',
                  ),
                  const Cards(
                    index: 48,
                    description:
                        'sads dfwefrge ergeg ergegr   ghfyv jhgfb hgfgftr gytfyjhbjbe egegerxsdjbc ',
                    image: 'assets/images/sample_image.png',
                    price: '₦50,000.00',
                    rating: '4.5',
                  ),
                  const Cards(
                    index: 49,
                    description:
                        'sads dfwefrge ergeg ergegr   ghfyv jhgfb hgfgftr gytfyjhbjbe egegerxsdjbc ',
                    image: 'assets/images/sample_image.png',
                    price: '₦50,000.00',
                    rating: '4.5',
                  ),
                ],
              ),
            ),
            77.sbH,
          ],
        ),
      ),
    );
  }
}

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String topString;
  final String bottomString;
  const IconAndText({
    super.key,
    required this.icon,
    required this.topString,
    required this.bottomString,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            icon,
            size: 20.sp,
            color: BookKeepingColors.mainColor,
          ),
        ),
        Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topString,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(bottomString,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
        )
      ],
    );
  }
}

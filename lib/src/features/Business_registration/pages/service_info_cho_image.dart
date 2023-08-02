
import 'package:bookkeep_app/src/features/Business_registration/widget/choose_gallery.dart';
import 'package:flutter/material.dart';


import '../../../constants/colors.dart';
import '../../../extension/size_config.dart';

import '../../authentication/views/signUp/widgets/scroll_function.dart';
import '../../authentication/views/signUp/widgets/topic_scroll.dart';


class ServiceVerifcationChooseImage extends StatelessWidget {
  final PageController controller;
  const ServiceVerifcationChooseImage({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(20)),
              child: Text(
                'Upload Photo',
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
            height: getProportionateScreenHeight(60),
          ),
          Container(
            width: getProportionateScreenWidth(250),
            height: getProportionateScreenHeight(250),
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(90)),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/photo.png'))),
          ),
          SizedBox(
            height: getProportionateScreenHeight(32),
          ),
           ChooseGallery(
            icons: Icons.image,
            text: 'Choose from Gallery',
            ontap: () {
              controller.nextPage(
                                  duration: const Duration(
                                    milliseconds: 250,
                                  ),
                                  curve: Curves.easeInOut);
            },
          ),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
           ChooseGallery(
            icons: Icons.camera,
            text: 'Take from Camera',
            ontap: () {
              controller.nextPage(
                                  duration: const Duration(
                                    milliseconds: 250,
                                  ),
                                  curve: Curves.easeInOut);
            },
          ),
        ],
      ),
    );
  }
}


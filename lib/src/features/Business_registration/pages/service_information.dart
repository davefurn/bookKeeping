import 'package:bookkeep_app/src/features/Business_registration/model/business_reg_model.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
import 'package:bookkeep_app/src/features/marketplace/accounting/model/models.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/app_error_widget.dart';
import 'package:bookkeep_app/src/features/marketplace/widget/special_button_2.dart';
import 'package:bookkeep_app/src/riverpod/providers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceInformationPage extends ConsumerStatefulWidget {
  const ServiceInformationPage({
    required this.businessModel,
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;
  final BusinessModel businessModel;

  @override
  ConsumerState<ServiceInformationPage> createState() =>
      _ServiceInformationPageState();
}

class _ServiceInformationPageState
    extends ConsumerState<ServiceInformationPage> {
  final formKey1 = GlobalKey<FormState>();
  late TextEditingController? serviceNameController;
  late TextEditingController? servicePhoneNumber;
  late TextEditingController? serviceEmail;
  late TextEditingController? serviceIndustry;
  late TextEditingController? serviceDescription;
  bool submitted1 = false;
  var state = LoadingState.normal;
  List<AllAcountingIndustriesModel>? value;

  @override
  void initState() {
    serviceNameController = TextEditingController();
    servicePhoneNumber = TextEditingController();
    serviceEmail = TextEditingController();
    serviceIndustry = TextEditingController();
    serviceDescription = TextEditingController();

    super.initState();
  }

  Future<void> createUserProcess1() async {
    setState(() {
      state = LoadingState.loading;
    });
    await PostRequest.createServiceProvider1(
      context,
      controller: widget.controller,
      email: serviceEmail!.text.trim(),
      industry: selectedValue,
      phoneNumber: servicePhoneNumber!.text.trim(),
      serviceName: serviceNameController!.text.trim(),
      serviceDescription: serviceDescription!.text.trim(),
    );

    widget.businessModel.email = serviceEmail!.text.trim();
    widget.businessModel.phone = servicePhoneNumber!.text.trim();
    widget.businessModel.industryId = selectedValue;
    widget.businessModel.serviceName = serviceNameController!.text.trim();
    widget.businessModel.serviceDescription = serviceDescription!.text.trim();

    setState(() {
      state = LoadingState.normal;
    });
  }

  String? selectedValue;
  Widget? loadingWidget() {
    return SizedBox(
      height: 600.h,
      child: Center(
          child: SizedBox.expand(
        child: Column(
          children: [
            const CircularProgressIndicator(
              strokeWidth: 3,
              color: BookKeepingColors.mainColor,
              backgroundColor: BookKeepingColors.backgroundColour,
            ),
            4.sbH,
            Text('Loading Industries...',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: BookKeepingColors.mainColor,
                    fontWeight: FontWeight.w600))
          ],
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var allAccountingIndustries = ref.watch(allAccountingIndustriesProvider);

    return SingleChildScrollView(
        child: allAccountingIndustries.when(
      data: (data) {
        if (data?.statusCode == 200 && data != null) {
          value = (data.data as List)
              .map((e) => AllAcountingIndustriesModel.fromJson(e))
              .toList();
          return value!.isNotEmpty
              ? SizedBox(
                  child: Form(
                    key: formKey1,
                    child: Column(
                      children: [
                        25.sbH,
                        const ScrollFunction(),
                        32.sbH,
                        const TopicScroll(
                          text: "Service Information",
                        ),
                        const TextInputSpace(),
                        CustomTextInput(
                            hintText: 'Service Name',
                            controller: serviceNameController,
                            autovalidateMode: submitted1
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your service name";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name),
                        8.sbH,
                        Padding(
                          padding: EdgeInsets.only(
                            right: 59.h,
                            left: 20.w,
                          ),
                          child: Text(
                            "Service Name should be service provided which can be job title e.g Software Engineer",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 14.sp,
                                    ),
                          ),
                        ),
                        const TextInputSpace(),
                        CustomTextInput(
                          hintText: 'Service Phone Number',
                          controller: servicePhoneNumber,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: submitted1
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your phone Number";
                            } else if (!phoneRegExp.hasMatch(value)) {
                              return "Please enter valid phone number";
                            } else if (value.length > 11) {
                              return "Your phone number is over 11 characters";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        const TextInputSpace(),
                        CustomTextInput(
                          hintText: 'Service Email Address',
                          controller: serviceEmail,
                          autovalidateMode: submitted1
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email";
                            } else if (!emailValidatorRegExp.hasMatch(value)) {
                              return "Please Enter valid Email";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                        ),
                        const TextInputSpace(),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: DropdownButtonFormField2<String>(
                              value: selectedValue,
                              isExpanded: true,
                              decoration: InputDecoration(
                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                // the menu padding when button's width is not specified.
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                  borderSide: const BorderSide(
                                      color: Color(0xffEAECF4), width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Color(0xffEAECF4), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: BookKeepingColors.mainColor,
                                      width: 2),
                                ),
                                // Add more decoration..
                              ),
                              hint: Text(
                                'Industry',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffAEB0B9),
                                ),
                              ),
                              items: value!.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.name.toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Choose an industry.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                selectedValue = value.toString();

                                //Do something when selected item is changed.
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 24,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  color: BookKeepingColors.backgroundColour,
                                  border: Border.all(
                                      color: BookKeepingColors.mainColor),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            )),
                        8.sbH,
                        Padding(
                          padding: EdgeInsets.only(
                            right: 68.w,
                            left: 20.w,
                          ),
                          child: Text(
                            "Choose industry closer or relates to the service you provide",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 14.sp,
                                    ),
                          ),
                        ),
                        20.sbH,
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                          ),
                          child: const Divider(
                            color: Color(0xffEAECF4),
                            thickness: 2,
                          ),
                        ),
                        20.sbH,
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.h),
                            child: Text(
                              'Short Service Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp),
                            ),
                          ),
                        ),
                        5.sbH,
                        Padding(
                          padding: EdgeInsets.only(
                            right: 68.w,
                            left: 20.w,
                          ),
                          child: Text(
                            "Choose industry closer or relates to the service you provide",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 14.sp,
                                    ),
                          ),
                        ),
                        16.sbH,
                        CustomTextInput(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          controller: serviceDescription,
                          hintText: 'Kindly enter description',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the desription of your business";
                            }
                            return null;
                          },
                          autovalidateMode: submitted1
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                        ),
                        12.sbH,
                        LoadingButton(
                            state: state,
                            onTap: () {
                              setState(() => submitted1 = true);
                              if (formKey1.currentState!.validate()) {
                                formKey1.currentState!.save();
                                createUserProcess1();
                              }
                            },
                            text: 'Next'),
                        20.sbH,
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  height: 600.h,
                  child: Center(
                      child: AppErrorWidget(
                    retry: SpecialButton2(
                        text:
                            'Couldn\'t fetch industries, check internet then Retry?',
                        onTap: () {
                          loadingWidget();
                          ref.invalidate(allAccountingIndustriesProvider);
                          allAccountingIndustries =
                              ref.read(allAccountingIndustriesProvider);
                        }),
                  )),
                );
        } else {
          return SizedBox(
            height: 600.h,
            child: Center(
                child: AppErrorWidget(
              retry: SpecialButton2(
                  backgroundColor: BookKeepingColors.mainColor,
                  borderColor: BookKeepingColors.mainColor,
                  textColor: BookKeepingColors.backgroundColour,
                  text: 'Check internet, Retry?',
                  onTap: () {
                    loadingWidget();
                    ref.invalidate(allAccountingIndustriesProvider);
                    allAccountingIndustries =
                        ref.read(allAccountingIndustriesProvider);
                  }),
            )),
          );
        }
      },
      error: (Object error, StackTrace stackTrace) => Center(
          child: AppErrorWidget(
        retry: SpecialButton2(
            text: 'Couldn\'t fetch industries, retry?',
            onTap: () {
              ref.invalidate(allAccountingIndustriesProvider);
              allAccountingIndustries =
                  ref.read(allAccountingIndustriesProvider);
            }),
      )),
      loading: loadingWidget,
    ));
  }
}

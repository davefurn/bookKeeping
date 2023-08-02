import 'package:bookkeep_app/src/features/Business_registration/model/business_reg_model.dart';
import 'package:bookkeep_app/src/features/Business_registration/model/nigeriian_states_model.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
import 'package:csc_picker/csc_picker.dart';

class ServiceInformationPage2 extends StatefulWidget {
  const ServiceInformationPage2({
    Key? key,
    required this.controller,
    required this.businessModel,
  }) : super(key: key);

  final PageController controller;

  final BusinessModel businessModel;

  @override
  State<ServiceInformationPage2> createState() =>
      _ServiceInformationPage2State();
}

class _ServiceInformationPage2State extends State<ServiceInformationPage2> {
  final formKey2 = GlobalKey<FormState>();
  late Future<List<NigerianStateModel>> nigerianStatesDetails;
  List<NigerianStateModel>? nigerianStateList;
  String? country;
  String? state;
  String? city;
  late TextEditingController? officeAddress;
  late TextEditingController? postalCode;
  bool submitted1 = false;
  var state1 = LoadingState.normal;

  @override
  void initState() {
    officeAddress = TextEditingController();
    postalCode = TextEditingController();
    super.initState();
  }

  Future<void> createUserProcess2() async {
    setState(() {
      state1 = LoadingState.loading;
    });
    await PostRequest.createServiceProvider2(
      context,
      controller: widget.controller,
      city: city!.trim(),
      state: state!,
      country: country!.trim(),
      postalCode: postalCode!.text.trim(),
      officeAddress: officeAddress!.text.trim(),
    );
    widget.businessModel.city = city!.trim();
    widget.businessModel.state = state!;
    widget.businessModel.country = country!.trim();
    widget.businessModel.postalCode = postalCode!.text.trim();
    widget.businessModel.officeAddress = officeAddress!.text.trim();
    setState(() {
      state1 = LoadingState.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Form(
          key: formKey2,
          child: Column(
            children: [
              25.sbH,
              const ScrollFunction(),
              32.sbH,
              const TopicScroll(
                text: "Service Information",
              ),
              16.sbH,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: const Divider(
                  color: Color(0xffEAECF4),
                  thickness: 2,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Service Location',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                ),
              ),
              4.sbH,
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 59.w,
                    left: 20.w,
                  ),
                  child: Text(
                    "Kindly tell us where you are offering your services from",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ),
              ),
              const TextInputSpace(),
              CustomTextInput(
                keyboardType: TextInputType.streetAddress,
                maxLines: 3,
                minLines: 1,
                controller: officeAddress,
                hintText: 'Official Address',
              ),
              const TextInputSpace(),
              CustomTextInput(
                keyboardType: TextInputType.number,
                controller: postalCode,
                hintText: 'Postal Code',
                maxLength: 6,
              ),
              const TextInputSpace(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CSCPicker(
                  
                  defaultCountry: CscCountry.Nigeria,

                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: true,
                  disableCountry: true,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: true,

                  ///Enable (get flat with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                    color: BookKeepingColors.backgroundColour,
                    border: Border.all(
                      color: BookKeepingColors.mainColor,
                    ),
                    borderRadius: BorderRadius.circular(4.r),
                  ),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                    color: BookKeepingColors.backgroundColour,
                    border: Border.all(
                      color: const Color(0xffEAECF4),
                    ),
                    borderRadius: BorderRadius.circular(4.r),
                  ),

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(
                    color: BookKeepingColors.secondaryColor,
                    fontSize: 17.sp,
                  ),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (value) {
                    setState(() {
                      ///store value in country variable
                      country = value;
                    });
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {
                    setState(() {
                      ///store value in state variable
                      state = value;
                    });
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {
                    setState(() {
                      ///store value in city variable
                      city = value;
                    });
                  },
                ),
              ),
              76.sbH,
              LoadingButton(
                state: state1,
                onTap: () {
                  setState(() => submitted1 = true);
                  if (formKey2.currentState!.validate()) {
                    createUserProcess2();
                  }
                },
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

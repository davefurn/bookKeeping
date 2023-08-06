import 'package:bookkeep_app/src/features/Business_registration/model/business_reg_model.dart';
import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class PinCodeBusiness extends StatefulWidget {
  final BusinessModel businessModel;

  const PinCodeBusiness({
    super.key,
    required this.businessModel,
  });

  @override
  State<PinCodeBusiness> createState() => _PinCodeBusinessState();
}

class _PinCodeBusinessState extends State<PinCodeBusiness> {
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  late TextEditingController otpController;
  late TextEditingController confirmOtpController;
  late StreamController<ErrorAnimationType> errorController;
  late StreamController<ErrorAnimationType> errorController2;
  bool hasError = false;
  bool hasError2 = false;
  String currentText = "";
  var state = LoadingState.normal;
  String currentText2 = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    errorController2 = StreamController<ErrorAnimationType>();

    otpController = TextEditingController();
    confirmOtpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    errorController2.close();
    errorController.close();
    super.dispose();
  }

  Future<void> createBusinessFinally() async {
    setState(() {
      state = LoadingState.loading;
    });
    await PostRequest.createBusinessUser(
      context,
      email: widget.businessModel.email,
      industryId: widget.businessModel.industryId,
      password: widget.businessModel.password,
      phone: widget.businessModel.phone,
      pin: otpController.text.trim(),
      serviceName: widget.businessModel.serviceName,
      serviceDescription: widget.businessModel.serviceDescription,
      country: widget.businessModel.country,
      city: widget.businessModel.city,
      officeAddress: widget.businessModel.officeAddress,
      postalCode: widget.businessModel.postalCode,
      state: widget.businessModel.state,
    );
    setState(() {
      state = LoadingState.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        const ScrollFunction(
          color2: BookKeepingColors.mainColor,
          color3: BookKeepingColors.mainColor,
        ),
        SizedBox(
          height: 32.h,
        ),
        const TopicScroll(
          text: "Security Pin",
        ),
        SizedBox(
          height: 32.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "Kindly enter your 4 secured security pin",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16,
                ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        pinKeys(context),
        SizedBox(
          height: 53.h,
        ),
        Text(
          "Confirm Pin",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
              ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Form(
          key: formKey4,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 97.w),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                obscureText: false,
                obscuringCharacter: '*',
                animationType: AnimationType.fade,
                // validator: (v) {
                //   if (v != otpController.text) {
                //     return "Pin Not Similar";
                //   } else {
                //     return null;
                //   }
                // },
                pinTheme: PinTheme(
                  inactiveColor: BookKeepingColors.subColor,
                  errorBorderColor: BookKeepingColors.failureColor,
                  activeColor: BookKeepingColors.mainColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5.r),
                  fieldHeight: 48.h,
                  fieldWidth: 48.w,
                  activeFillColor: hasError ? Colors.orange : Colors.white,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                textStyle: const TextStyle(
                    fontFamily: "Livvic", fontSize: 20, height: 1.6),
                backgroundColor: BookKeepingColors.backgroundColour,
                enableActiveFill: false,
                errorAnimationController: errorController2,
                controller: confirmOtpController,
                keyboardType: TextInputType.number,

                onCompleted: (v) {
                  if (kDebugMode) {
                    print("Completed");
                  }
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                  setState(() {
                    currentText2 = value;
                  });
                },
                beforeTextPaste: (text) {
                  if (kDebugMode) {
                    print("Allowing to paste $text");
                  }
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              )),
        ),
        LoadingButton(
            state: state,
            onTap: () {
              formKey3.currentState!.validate();
              // conditions for validating
              if (otpController.text != confirmOtpController.text) {
                errorController.add(ErrorAnimationType
                    .shake); // Triggering error shake animation
                errorController2.add(ErrorAnimationType.shake);
                setState(() {
                  hasError2 = true;
                });
              } else {
                setState(() {
                  hasError2 = false;

                  createBusinessFinally();
                });
              }
            },
            text: 'Finish Setup'),
        SizedBox(height: 42.h),
        OnClickToNewPage(
          text1: 'Already have an account?',
          onTap: () {
            pushTo(context, const Login());
          },
          text2: 'Sign In',
        ),
      ],
    );
  }

  Form pinKeys(BuildContext context) {
    return Form(
      key: formKey3,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 97.w),
          child: PinCodeTextField(
            appContext: context,
            pastedTextStyle: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.bold,
            ),
            length: 4,
            obscureText: false,
            obscuringCharacter: '*',
            animationType: AnimationType.fade,
            // validator: (v) {
            //   if (v!.length < 3) {
            //     return "I'm from validator";
            //   } else {
            //     return null;
            //   }
            // },
            pinTheme: PinTheme(
              inactiveColor: BookKeepingColors.subColor,
              errorBorderColor: BookKeepingColors.failureColor,
              activeColor: BookKeepingColors.mainColor,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5.r),
              fieldHeight: 48.h,
              fieldWidth: 48.w,
              activeFillColor: hasError ? Colors.orange : Colors.white,
            ),
            cursorColor: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            textStyle: const TextStyle(
                fontFamily: "Livvic", fontSize: 20, height: 1.6),
            backgroundColor: BookKeepingColors.backgroundColour,
            enableActiveFill: false,
            errorAnimationController: errorController,
            controller: otpController,
            keyboardType: TextInputType.number,

            onCompleted: (v) {
              if (kDebugMode) {
                print("Completed");
              }
            },
            // onTap: () {
            //   print("Pressed");
            // },
            onChanged: (value) {
              if (kDebugMode) {
                print(value);
              }
              setState(() {
                currentText = value;
              });
            },
            beforeTextPaste: (text) {
              if (kDebugMode) {
                print("Allowing to paste $text");
              }
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          )),
    );
  }
}

import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class PersonalInformation extends StatefulWidget {
  final PageController controller;
  final UserModel userModel;
  const PersonalInformation({
    Key? key,
    required this.controller,
    required this.userModel,
  }) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final formKey1 = GlobalKey<FormState>();
  late TextEditingController? firstNameController;
  late TextEditingController? lastNameController;
  late TextEditingController? emailController;
  late TextEditingController? phoneNumberController;
  bool submitted1 = false;

  @override
  void initState() {
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Form(
          key: formKey1,
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              const ScrollFunction(),
              SizedBox(
                height: 32.h,
              ),
              const TopicScroll(
                text: "Personal Information",
              ),
              const TextInputSpace(),
              CustomTextInput(
                autovalidateMode: submitted1
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your first name";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: 'First Name',
                keyboardType: TextInputType.name,
                controller: firstNameController,
              ),
              const TextInputSpace(),
              CustomTextInput(
                autovalidateMode: submitted1
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your Last name";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: 'Last Name',
                keyboardType: TextInputType.name,
                controller: lastNameController,
              ),
              const TextInputSpace(),
              CustomTextInput(
                  autovalidateMode: submitted1
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter your email";
                    } else if (!emailValidatorRegExp.hasMatch(value)) {
                      return "Please Enter Valid Email";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.email,
                      color: BookKeepingColors.secondaryColor,
                    ),
                    onPressed: () {},
                  )),
              const TextInputSpace(),
              CustomTextInput(
                autovalidateMode: submitted1
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your phone Number";
                  } else if (!phoneRegExp.hasMatch(value)) {
                    return "Please enter valid phone number";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
                controller: phoneNumberController,
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                color: BookKeepingColors.mainColor,
                thickLine: 1,
                onpressed: () {
                  setState(() => submitted1 = true);
                  if (formKey1.currentState!.validate()) {
                    formKey1.currentState!.save();
                    widget.userModel.email = emailController!.text.trim();
                    widget.userModel.firstName = firstNameController!.text.trim();
                    widget.userModel.lastName = lastNameController!.text.trim();
                    widget.userModel.phone = phoneNumberController!.text.trim();
                    widget.controller.nextPage(
                        duration: const Duration(
                          milliseconds: 100,
                        ),
                        curve: Curves.easeInOut);
                  }
                },
                text: 'Next',
                textcolor: BookKeepingColors.backgroundColour,
              ),
              SizedBox(height: 21.h),
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
      ),
    );
  }
}

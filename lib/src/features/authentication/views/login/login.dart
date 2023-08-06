import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = false;

  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];

  bool submitted = false;
  var state = LoadingState.normal;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  Future<void> verify() async {
    setState(() {
      state = LoadingState.loading;
    });
    await PostRequest.fetchBearerToken(
      context,
      login: true,
      email: emailController.text,
      password: passwordController.text,
    );
    setState(() {
      state = LoadingState.normal;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 58.25.h,
                  left: 20.w,
                ),
                child: backButton(context),
              ),
              Center(
                child: Image.asset(
                  'assets/images/onboarding_icon.png',
                  width:132.w,
                  height: 101.52.h,
                  fit: BoxFit.cover,
                ),
              ),
              TitleWidget(
                text: 'Log In',
                pDtop: 55.48.h,
                pDleft: 20.w,
                fontSize: 32.r,
              ),
              8.sbH,
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Kindly enter login details to get access to account",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.r,
                        ),
                  ),
                ),
              ),
              87.sbH,
              CustomTextInput(
                  validator: (String? value) {
                    if ((value == null || value.isEmpty) ||
                        !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  autovalidateMode: submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.email,
                      color: BookKeepingColors.secondaryColor,
                    ),
                    onPressed: () {},
                  )),
              const TextInputSpace(),
              CustomTextInput(
                autovalidateMode: submitted
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (v) {
                  if ((v == null || v.isEmpty) ||
                      !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*.:;+=-?&])[A-Za-z\d@$!%*.?&]{8,}$')
                          .hasMatch(v)) {
                    return 'Please enter a valid password';
                  } else if (v.length < 6) {
                    return 'The password is too short';
                  }
                  return null;
                },
                enableSuggestions: false,
                textInputAction: TextInputAction.done,
                expands: false,
                obscureText: isVisible ? false : true,
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Password',
                controller: passwordController,
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: BookKeepingColors.secondaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
              ),
                32.sbH,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text("Forgot Password",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: BookKeepingColors.mainColor)),
                ),
              ),
              90.sbH,
              LoadingButton(
                  state: state,
                  onTap: () {
                    setState(() => submitted = true);
                    if (_formKey.currentState!.validate()) {
                      verify();
                    }
                  },
                  text: 'Login'),
             42.sbH,
              OnClickToNewPage(
                text1: 'Don\'t have an account?',
                onTap: () {
                  pushTo(context, const SignUp());
                },
                text2: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

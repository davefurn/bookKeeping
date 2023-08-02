import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final userModel = UserModel();
  final controller = PageController(initialPage: 0);

  bool submitted = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 58.25.h,
                left: 25.w,
              ),
              child: backButton(context),
            ),
            TitleWidget(
              text: 'Create an Account',
              pDtop: 30.25.h,
              pDleft: 25.w,
              fontSize: 32.sp,
            ),
            8.sbH,
            Padding(
              padding: EdgeInsets.only(
                right: 53.w,
                left: 25.w,
              ),
              child: Text(
                "Kindly enter required details to get access to account",
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
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PersonalInformation(
                    controller: controller,
                    userModel: userModel,
                  ),
                  SecurityPassword(
                    controller: controller,
                    usermodel: userModel,
                  ),
                  PinCode(
                    usermodel: userModel,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

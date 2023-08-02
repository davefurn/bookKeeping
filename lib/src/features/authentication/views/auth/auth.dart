import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';


class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: BookKeepingColors.mainColor,
      body: Column(
        children: [
          Container(
            height:361.h,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/onbaording1.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Container(
            height: 571.h,
            width: double.maxFinite,
            decoration:  BoxDecoration(
              color: BookKeepingColors.onboardingWhiteColour,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 148.w,
                    right: 149.w,
                    top: 41.h,
                  ),
                  child: Image.asset(
                    'assets/images/onboarding_icon.png',
                    width: 132.w,
                    height: 101.52.h,
                    fit: BoxFit.cover,
                  ),
                ),
                198.48.sbH,
                CustomButton(
                  text: 'Continue as Service Provider',
                  onpressed: () {
                     pushTo(context, const LoginService());
                  },
                  thickLine: 1,
                  textcolor: BookKeepingColors.backgroundColour,
                ),
               26.sbH,
                CustomButton(
                  text: 'Continue as a user',
                  onpressed: () {
                    pushTo(context, const Login());
                  },
                  thickLine: 1,
                  borderColor: BookKeepingColors.mainColor,
                  color: BookKeepingColors.onboardingWhiteColour,
                  textcolor: BookKeepingColors.mainColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

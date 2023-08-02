import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class OnClickToNewPage extends StatelessWidget {
  final String text1;
  final VoidCallback onTap;
  final String text2;
  const OnClickToNewPage({
    super.key,
    required this.text1,
    required this.onTap,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: 'Livvic',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: BookKeepingColors.secondaryColor,
          ),
        ),
        8.sbW,
        Padding(
          padding: EdgeInsets.only(
            bottom: 2.h,
          ),
          child: InkWell(
            onTap: onTap,
            child: Text(
              text2,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: BookKeepingColors.mainColor),
            ),
          ),
        ),
      ],
    );
  }
}

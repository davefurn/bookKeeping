import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class CustomButton extends StatelessWidget {
  final double? hpD;
  final String text;
  final VoidCallback onpressed;
  final Color? color;
  final Color? textcolor;
  final Color? borderColor;
  final double thickLine;
  const CustomButton(
      {super.key,
      this.hpD,
      required this.text,
      required this.onpressed,
      this.color,
      this.textcolor,
      required this.thickLine,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hpD ?? getProportionateScreenWidth(20),
      ),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(
            color: borderColor ?? BookKeepingColors.mainColor,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 20,
                color: textcolor ?? BookKeepingColors.backgroundColour,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

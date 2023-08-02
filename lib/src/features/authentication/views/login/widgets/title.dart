import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final double? pDtop;
  final double? pDleft;
  final double? pDright;
  final double? width;
  final double? height;
  final double? fontSize;
  final TextAlign? textAlign;
  const TitleWidget({
    super.key,
    required this.text,
    this.pDtop,
    this.pDleft,
    this.pDright,
    this.width,
    this.height,
    this.textAlign,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
        top: pDtop ?? SizeConfig.screenHeight * .08,
        left: pDleft ?? getProportionateScreenWidth(102),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: width ?? double.maxFinite,
          child: Text(
            textAlign: textAlign ?? TextAlign.start,
            text,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: fontSize ?? 28, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

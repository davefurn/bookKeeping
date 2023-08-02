import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class ScrollFunction extends StatelessWidget {
  final Color color2;
  final Color color3;

  const ScrollFunction({
    Key? key,  this.color2 = BookKeepingColors.subColor,  this.color3  = BookKeepingColors.subColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: BookKeepingColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          height: getProportionateScreenHeight(3),
          width: getProportionateScreenWidth(70),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        Container(
          decoration: BoxDecoration(
            color: color2,
            borderRadius: BorderRadius.circular(15),
          ),
          height: getProportionateScreenHeight(3),
          width: getProportionateScreenWidth(70),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        Container(
          decoration: BoxDecoration(
            color: color3,
            borderRadius: BorderRadius.circular(15),
          ),
          height: getProportionateScreenHeight(3),
          width: getProportionateScreenWidth(70),
        )
      ],
    );
  }
}

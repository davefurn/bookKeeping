import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';


class ChooseGallery extends StatelessWidget {
  final IconData icons;
  final String text;
  final VoidCallback ontap;
  const ChooseGallery({
    Key? key,
    required this.icons,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: BookKeepingColors.subColor,
        height: getProportionateScreenHeight(56),
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(81),
        ),
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(42.5),
          right: getProportionateScreenWidth(41),
          top: getProportionateScreenHeight(18),
          bottom: getProportionateScreenHeight(18),
        ),
        child: Row(
          children: [
            Icon(
              icons,
              color: BookKeepingColors.mainColor,
            ),
            SizedBox(
              width: getProportionateScreenWidth(11.5),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

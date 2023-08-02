import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
class CustomUpload extends StatelessWidget {
  const CustomUpload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: getProportionateScreenHeight(72),
        width: getProportionateScreenWidth(390),
        decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: BookKeepingColors.mainColor),
        ),
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(10),
            right: getProportionateScreenWidth(10)),
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upload Document',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                  ),
            ),
            Container(
              width: getProportionateScreenWidth(42),
              height: getProportionateScreenHeight(42),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: BookKeepingColors.secondaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/cloud.png'))),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
class PasswordQueries extends StatelessWidget {
  const PasswordQueries({
    Key? key,
    required this.color, required this.text,
  }) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: getProportionateScreenWidth(20.87)),
      child: Row(
        children: [
          SvgPicture.asset("assets/svgs/Vector (10).svg", color: color, width: getProportionateScreenWidth(16.25), height: getProportionateScreenHeight(16.25),),
          SizedBox(width: getProportionateScreenWidth(9.88),),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14, 
                ),
          )
        ],
      ),
    );
  }
}

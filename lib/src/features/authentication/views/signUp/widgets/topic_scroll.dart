import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class TopicScroll extends StatelessWidget {
  final String text;
  final double? size;
  const TopicScroll({
    Key? key,
    required this.text, this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(fontWeight: FontWeight.w500, fontSize: size),
      ),
    );
  }
}

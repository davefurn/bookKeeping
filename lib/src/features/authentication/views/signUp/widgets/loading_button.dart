import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';
class LoadingButton extends StatefulWidget {
  final LoadingState state;
  final Function() onTap;
  final String text;
  final double? width;
  const LoadingButton(
      {super.key,
      required this.state,
      required this.onTap,
      this.width,
      required this.text});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: () {
        if (widget.state == LoadingState.normal) {
          widget.onTap();
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          6.r,
        ),
      ),
      color: BookKeepingColors.mainColor,
      minWidth: widget.width ?? MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: widget.state == LoadingState.loading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3,
                color: Colors.black,
              ),
            )
          : Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    color: BookKeepingColors.backgroundColour,
                  ),
            ),
    );
  }
}

import 'package:bookkeep_app/src/features/authentication/views/login/imports.dart';

class CustomTextInput extends StatelessWidget {
  final double? hpD;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;

  final bool readOnly;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final bool? enabled;
  final void Function()? onTap;
  final String? hintText;
  final String? titleText;
  final String? prefixPath;
  final Widget? suffixIcon;
  const CustomTextInput({
    Key? key,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.maxLength,
    this.minLines,
    this.expands = false,
    this.enabled,
    this.onChanged,
    this.controller,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.hintText = '',
    this.suffixIcon,
    this.prefixIcon,
    this.prefixPath,
    this.titleText,
    this.hpD,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hpD ?? getProportionateScreenWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autovalidateMode: autovalidateMode,
            controller: controller,
            cursorColor: Colors.black,
            onSaved: onSaved,
            validator: validator,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            readOnly: readOnly,
            autofocus: autofocus,
            obscuringCharacter: obscuringCharacter,
            obscureText: obscureText,
            enableSuggestions: enableSuggestions,
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            expands: expands,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            onTap: onTap,
            enabled: enabled,
            cursorHeight: 19,
            style: const TextStyle(
              fontFamily: 'Livvic',
              fontWeight: FontWeight.w400,
              fontSize: 20,
              height: 1,
              color: Color(0xFF1F2937),
            ),
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.symmetric(
              //   vertical: 15.h,
              //   horizontal: prefix != null ? 15.w : 12.w,
              // ),
              prefixIcon: null,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 14, color: const Color(0xffAEB0B9)),
              fillColor: BookKeepingColors.backgroundColour,
              filled: true,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: Color(0xffEAECF4), width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                    color: BookKeepingColors.mainColor, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                    color: BookKeepingColors.failureColor, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                    color: BookKeepingColors.failureColor, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

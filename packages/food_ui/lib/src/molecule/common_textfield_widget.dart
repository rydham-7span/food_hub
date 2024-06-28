import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ui/src/atoms/atoms.dart';
import 'package:food_ui/src/molecule/molecule.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    this.textEditingController,
    this.validator,
    this.inputTextStyle,
    super.key,
    this.textInputType,
    this.inputFormatter,
    this.hintText,
    this.contentPadding,
    this.fillColor,
    this.borderType,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.labelText,
    this.fontSizeForLabel = 12,
    this.suffixIcon,
    this.isEnabled = true,
    this.labelForTextField,
    this.errorText,
    this.isObscure = false,
    this.radius = 6,
    this.borderColor,
    this.hintTextStyle,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
  });

  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final String? hintText;
  final bool? isEnabled;
  final TextFieldBorder? borderType;
  final TextEditingController? textEditingController;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final String? labelText;
  final double? fontSizeForLabel;
  final Widget? suffixIcon;
  final String? labelForTextField;
  final String? errorText;
  final bool isObscure;
  final double radius;
  final Color? borderColor;
  final AutovalidateMode autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AppText.regular(
              labelText ?? '',
              fontSize: fontSizeForLabel,
              maxLines: 1,
            ),
          ),
        TextFormField(
          enabled: isEnabled,
          autovalidateMode: autoValidateMode,
          controller: textEditingController,
          obscureText: isObscure,
          textAlignVertical: TextAlignVertical.center,
          focusNode: focusNode,
          onChanged: onChange,
          cursorColor: context.colorScheme.blackColor,
          style: inputTextStyle ??
              context.textTheme?.title.copyWith(
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
                fontWeight: AppFontWeight.regular,
                color: context.colorScheme.tertiaryColor,
                package: 'food_ui',
              ),
          validator: validator,
          decoration: InputDecoration(
            errorText: errorText,
            prefixIcon: prefixIcon,
            labelStyle: context.textTheme?.title.copyWith(
              color:
                  (errorText?.isNotEmpty ?? false) ? context.colorScheme.m3RedColor : Colors.black,
            ),
            label: (labelForTextField?.isNotEmpty ?? false)
                ? AppText.regular(
                    labelForTextField ?? '',
                    fontSize: 14,
                  )
                : null,
            focusedBorder:
                getBorder(borderType, borderColor ?? context.colorScheme.mainThemeColor, 1.5),
            enabledBorder:
                getBorder(borderType, borderColor ?? context.colorScheme.m3Grey.withAlpha(85)),
            disabledBorder: getBorder(borderType, borderColor ?? context.colorScheme.m3Grey),
            errorMaxLines: 3,
            errorBorder: getErrorBorder(borderType, context.colorScheme.m3RedColor),
            border: getBorder(borderType, context.colorScheme.outlineColor),
            fillColor: fillColor ?? Colors.transparent,
            filled: true,
            isDense: true,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: suffixIcon,
            ),
            contentPadding:
                contentPadding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            hintText: hintText,
            errorStyle: TextStyle(
              color: context.colorScheme.m3RedColor,
            ),
            hintStyle: hintTextStyle ??
                context.textTheme?.title.copyWith(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: AppFontWeight.medium,
                  color: context.colorScheme.m3Grey.withAlpha(150),
                  package: 'food_ui',
                ),
          ),
          textCapitalization: TextCapitalization.sentences,
          keyboardType: textInputType,
          inputFormatters: inputFormatter,
        ),
      ],
    );
  }

  InputBorder? getErrorBorder(TextFieldBorder? borderType, Color errorColor) {
    switch (borderType) {
      case TextFieldBorder.outlinedBorder:
        return OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        );
      case TextFieldBorder.baseBorder:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        );
      case TextFieldBorder.none:
        return UnderlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        );
      case TextFieldBorder.forGuestContact:
        return InputBorder.none;
      case null:
    }
    return null;
  }

  InputBorder? getBorder(TextFieldBorder? borderType, Color borderColor, [double borderWidth = 1]) {
    return switch (borderType) {
      TextFieldBorder.outlinedBorder => OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      TextFieldBorder.baseBorder => const UnderlineInputBorder(),
      TextFieldBorder.none => InputBorder.none,
      TextFieldBorder.forGuestContact => InputBorder.none,
      null => null,
    };
  }
}

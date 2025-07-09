import 'package:flutter/material.dart';
import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomTextField extends StatelessWidget {
  final double? height;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Widget? sufIcon;
  final Widget? preIcon;
  final bool? readOnly;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final ValueChanged<String>? onChange;
  final double borderRadius;
  final Color? containerColor;
  final Color? borderColor;

  const CustomTextField({
    super.key,
    this.height = 48,
    this.controller,
    this.hintText,
    this.hintTextStyle,
    this.sufIcon,
    this.preIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.onChange,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.borderRadius = 12,
    this.containerColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor ?? AppColors.borderColor),
        color: containerColor,
      ),
      child: TextField(
        textInputAction: TextInputAction.done,
        onChanged: onChange,
        readOnly: readOnly!,
        obscureText: obscureText!,
        obscuringCharacter: "*",
        onTap: onTap,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText ?? '',
          hintStyle: hintTextStyle ?? h5.copyWith(color: AppColors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          prefixIcon: preIcon,
          suffixIcon: sufIcon,
          border: InputBorder.none,
          constraints: BoxConstraints(
            maxHeight: height!,
            minWidth: MediaQuery.sizeOf(context).width
          )
        ),
      ),
    );
  }
}

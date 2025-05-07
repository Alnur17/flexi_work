import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final double width;
  final double height;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final List<Color> gradientColors;
  final Color dropdownColor;
  final String iconPath;
  final double iconScale;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width = 100,
    this.height = 40,
    this.padding = const EdgeInsets.only(left: 16, right: 8),
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.gradientColors = AppColors.gradientColor,
    this.dropdownColor = AppColors.black,
    this.iconPath = AppImages.arrowDown,
    this.iconScale = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          colors: gradientColors,
        ),
      ),
      child: DropdownButton<T>(
        borderRadius: BorderRadius.circular(12),
        isExpanded: true,
        underline: Container(),
        icon: Container(
          decoration: const ShapeDecoration(
            shape: CircleBorder(),
            color: AppColors.white,
          ),
          child: Image.asset(
            iconPath,
            scale: iconScale,
          ),
        ),
        dropdownColor: dropdownColor,
        value: value,style: h5.copyWith(color: AppColors.white,fontWeight: FontWeight.w600),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:music_app/util/app_colors.dart';

import 'custom_text.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double textsize;
  final Color color;
  final Color textColor;
  final bool radius;
  final FontWeight fontWeight;
  final Function()? onTap;
  const CustomContainer({
    Key? key,
    required this.text,
    this.width = 250,
    this.height = 49,
    this.color = AppColors.primaryGreen,
    this.textColor = AppColors.primaryWhite,
    this.radius = false,
    this.textsize = 14,
    this.fontWeight = FontWeight.w500,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ? 30 : 0),
          color: color,
        ),
        child: Center(
          child: CustomText(
            text: text,
            center: true,
            fontWeight: fontWeight,
            color: textColor,
            size: textsize,
          ),
        ),
      ),
    );
  }
}

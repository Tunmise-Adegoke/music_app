import 'package:flutter/material.dart';
import 'package:music_app/util/dimensions.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool center;
  final FontWeight fontWeight;
  final Function()? ontap;
  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.size = 14,
    this.center = false,
    this.fontWeight = FontWeight.w500,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSize as = AppSize(context);
    return GestureDetector(
      onTap: ontap,
      child: Text(
        text,
        textAlign: center ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          color: color,
          fontFamily: 'Satoshi',
          fontWeight: fontWeight,
          fontSize: as.sizeHeightPercent(size),
        ),
      ),
    );
  }
}

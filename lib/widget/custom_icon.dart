
import 'package:flutter/material.dart';

import '../util/app_colors.dart';
import '../util/dimensions.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function()? onClick;
  final Color color;
  const CustomIcon(
      {Key? key,
      required this.icon,
      this.onClick,
      this.size = 30,
      this.color = AppColors.lightGrey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSize as = AppSize(context);
    return GestureDetector(
      onTap: onClick,
      child: Icon(
        icon,
        size: as.wp(size),
        color: color,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:music_app/util/app_colors.dart';
import 'package:music_app/util/dimensions.dart';
import 'package:music_app/widget/custom_icon.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSize as = AppSize(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: as.hp(32),
        width: as.wp(32),
        decoration: const BoxDecoration(
          color: AppColors.primaryWhite,
          shape: BoxShape.circle,
        ),
        child: const CustomIcon(
          icon: Hicons.left_2_bold,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}

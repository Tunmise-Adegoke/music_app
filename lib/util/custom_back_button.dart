import 'package:flutter/material.dart';
import 'package:music_app/util/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const CircleAvatar(
        backgroundColor: AppColors.primaryWhite,
        radius: 20,
        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.black,
        ),
      ),
    );
  }
}

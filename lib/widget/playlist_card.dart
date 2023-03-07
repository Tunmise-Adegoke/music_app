import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import '../util/app_colors.dart';
import 'custom_icon.dart';
import 'custom_text.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: GestureDetector(
          child: const CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.primaryWhite,
            child: CustomIcon( icon:
              Hicons.play_bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      title: const CustomText(
        text: 'As It Was',
        fontWeight: FontWeight.w700,
        color: Colors.black,
        size: 16,
      ),
      subtitle: const CustomText(
        text: 'Harry Styles',
        fontWeight: FontWeight.w400,
        color: Colors.black,
        size: 12,
      ),
      trailing: Wrap(
        spacing: 50.75,
        children: const [
          CustomText(
            text: '5:33',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            size: 15,
          ),
          CustomIcon(icon:
            Hicons.heart_1_bold,
            color: AppColors.primaryWhite,
          ),
        ],
      ),
    );
  }
}

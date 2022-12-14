import 'package:flutter/material.dart';
import 'package:music_app/util/app_colors.dart';
import 'package:music_app/util/custom_text.dart';

class SongCard extends StatelessWidget {
  const SongCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 157,
            child: Stack(
              children: [
                Container(
                  height: 187,
                  width: 147,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(image: AssetImage('assets/images/Billie Eilish - Bad Guy.jpg'
                    ),
                    fit: BoxFit.fitHeight),
                  ),
                ),
                Positioned(
                  top: 160,
                  right: 20,
                  child: GestureDetector(
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.primaryWhite,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const CustomText(
            text: 'Bad Guy',
            fontWeight: FontWeight.w700,
            color: Colors.black,
            size: 16,
          ),
          const SizedBox(height: 3),
          const CustomText(
            text: 'Billie Eilish',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            size: 14,
          ),
        ],
      ),
    );
  }
}

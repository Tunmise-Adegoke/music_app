import 'package:flutter/material.dart';
import 'package:music_app/util/app_colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widget/custom_back_button.dart';
import '../widget/custom_text.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CustomBackButton(),
        centerTitle: true,
        title: const CustomText(text: 'Now Playing'),
        actions: const [
          Icon(Icons.menu),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 370,
            width: 335,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/Billie Eilish - Bad Guy.jpg'),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: 'Bad Guy',
                  size: 20,
                  fontWeight: FontWeight.w700,
                ),
                Icon(Icons.favorite),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const CustomText(
            text: 'Billie Eilish',
            size: 20,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGrey,
          ),
          const SizedBox(height: 52),
          LinearPercentIndicator(
            lineHeight: 6,
            width: 162,
            fillColor: AppColors.lightGrey,
          )
        ],
      ),
    );
  }
}

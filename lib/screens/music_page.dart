import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:music_app/provider/audioplayer_provider.dart';
import 'package:music_app/screens/lyrics.dart';
import 'package:music_app/services/firebase_services.dart';
import 'package:music_app/util/app_colors.dart';
import 'package:music_app/util/dimensions.dart';
import 'package:music_app/widget/horizontal_box.dart';
import 'package:music_app/widget/vertical_box.dart';
import 'package:provider/provider.dart';

import '../widget/custom_back_button.dart';
import '../widget/custom_icon.dart';
import '../widget/custom_text.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    AppSize as = AppSize(context);
    final audioP = Provider.of<AudioProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Transform.scale(
          scale: 0.6,
          child: const CustomBackButton(),
        ),
        centerTitle: true,
        title: const CustomText(
          text: 'Now Playing',
          size: 18,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: as.wp(28)),
            child: const CustomIcon(
              icon: Hicons.menu,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: as.hp(370),
              width: as.wp(335),
              margin: EdgeInsets.symmetric(
                horizontal: as.wp(27),
              ),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/Billie Eilish - Bad Guy.jpg',
                    ),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            VerticalBox(size: 17),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: as.wp(28)),
              child: const ListTile(
                visualDensity: VisualDensity(horizontal: 0),
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                title: CustomText(
                  text: 'Bad Guy',
                  size: 20,
                  fontWeight: FontWeight.w700,
                ),
                subtitle: CustomText(
                  text: 'Billie Eilish',
                  size: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
                trailing: CustomIcon(
                  icon: Hicons.heart_1,
                ),
              ),
            ),
            VerticalBox(size: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: as.wp(18)),
              child: SliderTheme(
                data: const SliderThemeData(
                  thumbColor: AppColors.lightGrey,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 3.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 4.0),
                  trackHeight: 3,
                ),
                child: Slider(
                  min: 0.0,
                  max: audioP.duration.inSeconds.toDouble(),
                  value: audioP.position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    audioP.seek(value);
                  },
                  focusNode: FocusNode(),
                ),
              ),
            ),
            VerticalBox(size: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: as.wp(27)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: formatTime(audioP.position)),
                  CustomText(text: formatTime(audioP.duration - audioP.position)),
                ],
              ),
            ),
            VerticalBox(size: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 67.25),
              child: Row(
                children: [
                  const CustomIcon(
                    icon: Hicons.repeate_3,
                  ),
                  HorizontalBox(size: 15),
                  const CustomIcon(
                    icon: Hicons.previous,
                    color: AppColors.blackGrey,
                  ),
                  HorizontalBox(size: 10),
                  Container(
                    height: as.hp(72),
                    width: as.wp(72),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: CustomIcon(
                        icon: audioP.isPlaying ? Hicons.pause : Hicons.play,
                      ),
                    ),
                  ),
                  HorizontalBox(size: 10), 
                  const CustomIcon(
                    icon: Hicons.next,
                    color: AppColors.blackGrey,
                  ),
                  HorizontalBox(size: 10),
                  const CustomIcon(
                    icon: Hicons.shuffle_1_bold,
                    color: AppColors.blackGrey,
                  ),
                ],
              ),
            ),
            VerticalBox(size: 44.95),
            Center(
              child: Column(
                children: [
                  const CustomIcon(
                    icon: Hicons.left_3_bold,
                    color: AppColors.blackGrey,
                  ),
                  CustomText(
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const LyricsPage())));
                    },
                    text: 'Lyrics',
                    color: AppColors.lightGrey,
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // formatTime(Duration duration) {
  //   String twoDigits(int n) => n.toString().padLeft(2, '0');
  //   final hours = twoDigits(duration.inHours);
  //   final minutes = twoDigits(duration.inMinutes.remainder(60));
  //   final seconds = twoDigits(duration.inSeconds.remainder(60));
  //   return [
  //     if (duration.inHours > 0) hours,
  //     minutes,
  //     seconds,
  //   ].join('1');
  // }
}

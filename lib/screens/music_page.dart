import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/lyrics.dart';
import 'package:music_app/util/app_colors.dart';
import 'package:music_app/util/dimensions.dart';
import 'package:music_app/widget/horizontal_box.dart';
import 'package:music_app/widget/vertical_box.dart';

import '../widget/custom_back_button.dart';
import '../widget/custom_text.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSize as = AppSize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const CustomBackButton(),
        centerTitle: true,
        title: const CustomText(
          text: 'Now Playing',
          size: 18,
          fontWeight: FontWeight.w700,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: as.sizeWidthPercent(28)),
            child: const Icon(
              Icons.menu,
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
              height: as.sizeHeightPercent(370),
              width: as.sizeWidthPercent(335),
              margin: EdgeInsets.symmetric(
                horizontal: as.sizeWidthPercent(27),
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
              padding:
                  EdgeInsets.symmetric(horizontal: as.sizeWidthPercent(28)),
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
            VerticalBox(size: 6),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: as.sizeWidthPercent(28)),
              child: const CustomText(
                text: 'Billie Eilish',
                size: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGrey,
              ),
            ),
            VerticalBox(size: 52),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: as.sizeWidthPercent(27)),
              child: Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {},
              ),
            ),
            VerticalBox(size: 10),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: as.sizeWidthPercent(28)),
              child: Row(
                children: [
                  CustomText(text: formatTime(position)),
                  CustomText(text: formatTime(duration - position)),
                ],
              ),
            ),
            VerticalBox(size: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 67.25),
              child: Row(
                children: [
                  const CustomIcon(
                    icon: Icons.repeat_on_rounded,
                  ),
                  HorizontalBox(size: 15),
                  const CustomIcon(
                    icon: Icons.skip_previous_outlined,
                    color: AppColors.blackGrey,
                  ),
                  HorizontalBox(size: 10),
                  Container(
                    height: as.sizeHeightPercent(72),
                    width: as.sizeWidthPercent(72),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: CustomIcon(
                        icon: isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                  ),
                  HorizontalBox(size: 10),
                  const CustomIcon(
                    icon: Icons.skip_next_outlined,
                    color: AppColors.blackGrey,
                  ),
                  HorizontalBox(size: 10),
                  const CustomIcon(
                    icon: Icons.shuffle_on_rounded,
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
                    icon: Icons.arrow_upward_rounded,
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

  formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join('1');
  }
}

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
        size: as.sizeWidthPercent(size),
        color: color,
      ),
    );
  }
}

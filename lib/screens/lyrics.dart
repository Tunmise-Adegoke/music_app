import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/util/dimensions.dart';
import 'package:music_app/widget/custom_back_button.dart';

import '../util/app_colors.dart';
import '../widget/custom_text.dart';
import '../widget/horizontal_box.dart';
import '../widget/vertical_box.dart';
import 'music_page.dart';

class LyricsPage extends StatefulWidget {
  const LyricsPage({Key? key}) : super(key: key);

  @override
  State<LyricsPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Billie Eilish - Bad Guy.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomBackButton(),
                  CustomText(text: 'Bad Guy'),
                  CustomIcon(icon: Icons.menu_outlined),
                ],
              ))
        ],
      ),
      bottomSheet: Container(
        height: as.sizeHeightPercent(200),
        width: double.maxFinite,
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: as.sizeWidthPercent(15)),
              child: ListTile(
                
                leading: Container(
                    height: as.sizeHeightPercent(42),
                    width: as.sizeWidthPercent(42),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Billie Eilish - Bad Guy.jpg')),
                        shape: BoxShape.circle)),
                title: const CustomText(
                  text: 'Bad Guy',
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
                subtitle: const CustomText(
                  text: 'Billie Eilish',
                  size: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
                trailing: const Icon(Icons.favorite),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: as.sizeWidthPercent(31)),
              child: Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {},
              ),
            ),
            VerticalBox(size: 1),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: as.sizeWidthPercent(31)),
              child: Row(
                children: [
                  CustomText(text: formatTime(position)),
                  CustomText(text: formatTime(duration - position)),
                ],
              ),
            ),
            VerticalBox(size: 11),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: as.sizeWidthPercent(71.84)),
              child: Row(
                children: [
                  const CustomIcon(
                    icon: Icons.repeat_on_rounded,
                  ),
                  HorizontalBox(size: 10),
                  const CustomIcon(
                    icon: Icons.skip_next_outlined,
                    color: AppColors.blackGrey,
                  ),
                  HorizontalBox(size: 10),
                  Container(
                    height: as.sizeHeightPercent(51),
                    width: as.sizeWidthPercent(51),
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
          ],
        ),
      ),
    );
  }
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

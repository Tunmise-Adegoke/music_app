import 'package:flutter/material.dart';
import 'package:music_app/screens/register/register.dart';
import 'package:music_app/util/app_colors.dart';

import '../../util/custom_container.dart';
import '../../util/custom_text.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/wp4780558-billie-eilish-glasses-wallpapers 1.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 42),
              Center(
                child: Image.asset('assets/images/icons/Vector (1).png'),
              ),
              const SizedBox(height: 403),
              const CustomText(
                text: 'Enjoy Listening to music',
                color: AppColors.primaryWhite,
                fontWeight: FontWeight.w700,
                size: 25,
              ),
              const SizedBox(height: 21),
              const CustomText(
                text: 'Lorem ipsum dolor sit amet,',
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                size: 17,
              ),
              const CustomText(
                text: 'consectetur adipiscing elit. Sagittis enim',
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                size: 17,
              ),
              const CustomText(
                text: 'purus sed phasellus.Cursus ornare id',
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                size: 17,
              ),
              const CustomText(
                text: 'scelerisque aliquam.',
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                size: 17,
              ),
              const SizedBox(height: 37),
              CustomContainer(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScrren()));
                },
                text: 'Oya, Lets Start',
                height: 92,
                width: 429,
                radius: true,
                textsize: 22,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

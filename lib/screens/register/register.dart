import 'package:flutter/material.dart';
import 'package:music_app/screens/register/login.dart';
import 'package:music_app/screens/register/sigin_in.dart';
import 'package:music_app/util/app_colors.dart';

import '../../util/custom_container.dart';
import '../../util/custom_text.dart';

class RegisterScrren extends StatelessWidget {
  const RegisterScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 405,
              child: Image.asset(
                  'assets/images/15mag-billie-03-master675-v3 1.png'),
            ),
            Positioned(
              top: 60,
              left: 10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  backgroundColor: AppColors.primaryWhite,
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 175,
              left: 78,
              right: 77,
              child: Image.asset('assets/images/icons/Vector (1).png'),
            ),
            const Positioned(
              top: 301,
              left: 60,
              child: CustomText(
                text: 'Enjoy Listening to Music',
                color: Colors.black,
                fontWeight: FontWeight.w700,
                size: 26,
                center: true,
              ),
            ),
            const Positioned(
              top: 357,
              left: 60,
              child: CustomText(
                text: 'Spotify is a proprietary Swedish audio',
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                size: 17,
              ),
            ),
            const Positioned(
              top: 380,
              left: 60,
              child: CustomText(
                text: 'streaming and media services provider',
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w400,
                size: 17,
              ),
            ),
            Positioned(
              top: 433,
              left: 30,
              child: CustomContainer(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                text: 'Register',
                height: 73,
                width: 147,
                radius: true,
                textsize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Positioned(
              top: 433,
              right: 30,
              child: CustomContainer(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                text: 'Sign In',
                height: 73,
                width: 147,
                radius: true,
                textsize: 19,
                textColor: Colors.black,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_app/widget/custom_input_field.dart';

import '../../util/app_colors.dart';
import '../../widget/custom_container.dart';
import '../../widget/custom_text.dart';
import '../../widget/horizontal_box.dart';
import '../../widget/vertical_box.dart';
import '../home/home_page.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalBox(size: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryWhite,
                      radius: 20,
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  HorizontalBox(size: 82),
                  Image.asset('assets/images/icons/Vector (2).png'),
                ],
              ),
            ),
            VerticalBox(size: 80),
            const Center(
              child: CustomText(
                text: 'Forgot Password ?',
                color: Colors.black,
                fontWeight: FontWeight.w700,
                size: 30,
              ),
            ),
            VerticalBox(size: 10),
            const Center(
              child: CustomText(
                text: 'I know right, it happens all the time',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                size: 16,
              ),
            ),
            VerticalBox(size: 30),
            const InputField(
              hint: 'Enter New Password',
              size: 16,
            ),
            VerticalBox(size: 22),
            Center(
              child: CustomContainer(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                text: 'Enter',
                height: 80,
                width: 325,
                fontWeight: FontWeight.w700,
                radius: true,
                textsize: 20,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

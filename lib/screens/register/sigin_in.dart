import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/home/home_page.dart';
import 'package:music_app/screens/register/forgot_password.dart';
import 'package:music_app/util/custom_input_field.dart';

import '../../util/app_colors.dart';
import '../../util/custom_container.dart';
import '../../util/custom_text.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback? showSignPage;
  const SignInScreen({Key? key, this.showSignPage}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  
  final _emailC = TextEditingController();
  final _passwordC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailC.text.trim(),
      password: _passwordC.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36),
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
                  const SizedBox(width: 82),
                  Image.asset('assets/images/icons/Vector (2).png'),
                ],
              ),
            ),
            const SizedBox(height: 80),
            const Center(
              child: CustomText(
                text: 'Sign In',
                color: Colors.black,
                fontWeight: FontWeight.w700,
                size: 30,
              ),
            ),
            const SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'If you need any support ',
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.w400,
                  size: 12,
                ),
                CustomText(
                  ontap: () {},
                  text: 'Click Here',
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.w400,
                  size: 12,
                ),
              ],
            ),
            const SizedBox(height: 38),
            InputField(
              controller: _emailC,
              hint: 'Enter Email',
              size: 16,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: _passwordC,
              hint: 'Enter Password',
              size: 16,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: CustomText(
                ontap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword())),
                text: 'Recovery Password',
                color: Colors.black,
                fontWeight: FontWeight.w500,
                size: 14,
              ),
            ),
            const SizedBox(height: 22),
            Center(
              child: CustomContainer(
                onTap: () {
                  signIn();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomeScreen()));
                },
                text: 'Sign In',
                height: 80,
                width: 325,
                fontWeight: FontWeight.w700,
                radius: true,
                textsize: 20,
                textColor: Colors.white,
              ),
            ),
            const SizedBox(height: 21),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      height: 5,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 11),
                  CustomText(
                    text: 'Or',
                    fontWeight: FontWeight.w400,
                    size: 12,
                    color: Colors.black,
                  ),
                  SizedBox(width: 11),
                  Expanded(
                    child: Divider(
                      height: 5,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.88),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 137.73),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icons/google_PNG19635.png',
                    height: 35,
                    width: 35,
                  ),
                  const SizedBox(width: 58.28),
                  Image.asset(
                    'assets/images/icons/icons8-apple-logo-30.png',
                    height: 35,
                    width: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 57),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 98),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'Not A Member ? ',
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    ontap: widget.showSignPage,
                    text: 'Register Now',
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

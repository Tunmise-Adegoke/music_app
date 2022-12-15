import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/widget/custom_back_button.dart';
import 'package:music_app/widget/custom_container.dart';

import '../../util/app_colors.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/custom_text.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? showLoginPage;
  const LoginScreen({Key? key, this.showLoginPage}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameC = TextEditingController();
  final _passwordC = TextEditingController();
  final _emailC = TextEditingController();

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  Future login() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailC.text.trim(),
      password: _passwordC.text.trim(),
    );
  }

  Future addUserDetails(
    String name,
    String email,
    String password,
  ) async {
    await FirebaseFirestore.instance.collection('user').add({
      'Name': name,
      'email': email,
      'password': password,
    });
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
                  const CustomBackButton(),
                  const SizedBox(width: 82),
                  Image.asset('assets/images/icons/Vector (2).png'),
                ],
              ),
            ),
            const SizedBox(height: 80),
            const Center(
              child: CustomText(
                text: 'Register',
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
              controller: _nameC,
              hint: 'Full Name',
              size: 16,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: _emailC,
              hint: 'Enter Username or Email',
              size: 16,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: _passwordC,
              hint: 'Enter Password',
              size: 16,
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomContainer(
                onTap: () {
                  login();
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
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 98),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'I am a member? ',
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    ontap: widget.showLoginPage,
                    text: 'Sign in',
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 27),
          ],
        ),
      ),
    );
  }
}

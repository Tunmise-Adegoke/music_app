import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/util/constants.dart';
import 'package:music_app/widget/custom_back_button.dart';
import 'package:music_app/widget/custom_container.dart';
import 'package:music_app/widget/horizontal_box.dart';
import '../../util/app_colors.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/custom_text.dart';
import '../../widget/vertical_box.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  final Function()? showLoginPage;
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
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => CircularProgressIndicator(),
    //     );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailC.text.trim(),
        password: _passwordC.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
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
            VerticalBox(size: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                children: [
                  const CustomBackButton(),
                  HorizontalBox(size: 82),
                  Image.asset('assets/images/icons/Vector (2).png'),
                ],
              ),
            ),
            VerticalBox(size: 80),
            const Center(
              child: CustomText(
                text: 'Register',
                color: Colors.black,
                fontWeight: FontWeight.w700,
                size: 30,
              ),
            ),
            VerticalBox(size: 22),
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
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()));
                  },
                  text: 'Click Here',
                  color: AppColors.primaryGreen,
                  fontWeight: FontWeight.w400,
                  size: 12,
                ),
              ],
            ),
            VerticalBox(size: 38),
            InputField(
              controller: _nameC,
              hint: 'Full Name',
              size: 16,
            ),
            VerticalBox(size: 16),
            InputField(
              controller: _emailC,
              hint: 'Enter Username or Email',
              size: 16,
            ),
            VerticalBox(size: 16),
            InputField(
              controller: _passwordC,
              hint: 'Enter Password',
              size: 16,
            ),
            VerticalBox(size: 20),
            Center(
              child: CustomContainer(
                onTap: login,
                text: 'Sign In',
                height: 80,
                width: 325,
                fontWeight: FontWeight.w700,
                radius: true,
                textsize: 20,
                textColor: Colors.white,
              ),
            ),
            VerticalBox(size: 21),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      height: 5,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  HorizontalBox(size: 11),
                  const CustomText(
                    text: 'Or',
                    fontWeight: FontWeight.w400,
                    size: 12,
                    color: Colors.black,
                  ),
                  HorizontalBox(size: 11),
                  const Expanded(
                    child: Divider(
                      height: 5,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            VerticalBox(size: 50.88),
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
                  HorizontalBox(size: 50.28),
                  Image.asset(
                    'assets/images/icons/icons8-apple-logo-30.png',
                    height: 35,
                    width: 35,
                  ),
                ],
              ),
            ),
            VerticalBox(size: 27),
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
            VerticalBox(size: 27),
          ],
        ),
      ),
    );
  }
}

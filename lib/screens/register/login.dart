import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/register/main_page.dart';
import 'package:music_app/screens/register/sigin_in.dart';
import 'package:music_app/util/toast.dart';
import 'package:music_app/widget/custom_back_button.dart';
import 'package:music_app/widget/custom_container.dart';
import 'package:music_app/widget/horizontal_box.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import '../../services/firebase_services.dart';
import '../../util/app_colors.dart';
import '../../util/text_editing_ctrl.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/custom_text.dart';
import '../../widget/vertical_box.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditCtrl myController = TextEditCtrl();
  final FirebaseServices services = FirebaseServices();

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
              VerticalBox(size: 45),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  children: [
                    const CustomBackButton(),
                    HorizontalBox(size: 80),
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
                controller: myController.nameC,
                hint: 'Full Name',
                size: 16,
              ),
              VerticalBox(size: 16),
              InputField(
                controller: myController.loginEmailC,
                hint: 'Enter Username or Email',
                size: 16,
              ),
              VerticalBox(size: 16),
              InputField(
                controller: myController.loginPassC,
                hint: 'Enter Password',
                size: 16,
              ),
              VerticalBox(size: 20),
              Center(
                child: CustomContainer(
                  onTap: _userLogin,
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
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // if (snapshot.data == null ||
                    //     snapshot.data?.isAnonymous == true) ...[
                    FlutterSocialButton(
                      onTap: _userGoogleSignIn,
                      buttonType: ButtonType.google,
                      mini: true,
                    ),
                    // HorizontalBox(size: 50.28),
                    FlutterSocialButton(
                      onTap: () async {
                        await services.siginWithOAuth(
                            'apple.com', ['email'], {'locale': 'en'});
                      },
                      buttonType: ButtonType.apple,
                      mini: true,
                    ),
                    // HorizontalBox(size: 50.28),
                    FlutterSocialButton(
                      onTap: () async {
                        await services.siginWithOAuth(
                            'github.com', ['email'], {'locale': 'en'});
                      },
                      buttonType: ButtonType.github,
                      mini: true,
                    ),
                  ],
                  // ],
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
                      ontap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignInScreen();
                        }));
                      },
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
        ));
  }

  void _userGoogleSignIn() async {
    User? user = await services.signInGoogle().whenComplete(() =>
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const MainPage();
        })));
    if (user != null) {
      const Toast(message: 'User is signedIn');
    } else {
      const Toast(
        message: 'Sign In failed',
      );
    }
  }

  void _userLogin() async {
    await services.login().whenComplete(() => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const MainPage();
        })));
  }
}

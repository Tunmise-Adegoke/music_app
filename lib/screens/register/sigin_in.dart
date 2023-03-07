import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:music_app/screens/register/forgot_password.dart';
import 'package:music_app/screens/register/main_page.dart';
import 'package:music_app/services/firebase_services.dart';
import 'package:music_app/util/dimensions.dart';
import 'package:music_app/widget/custom_back_button.dart';
import 'package:music_app/widget/custom_container.dart';
import 'package:music_app/widget/horizontal_box.dart';
import '../../util/app_colors.dart';
import '../../util/text_editing_ctrl.dart';
import '../../util/toast.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/custom_text.dart';
import '../../widget/vertical_box.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditCtrl myController = TextEditCtrl();
  final FirebaseServices services = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    AppSize as = AppSize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 45),
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
              controller: myController.signInEmailC,
              hint: 'Enter Email',
              size: 16,
            ),
            const SizedBox(height: 16),
            InputField(
              controller: myController.signInPassC,
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
            VerticalBox(size: 50.88),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterSocialButton(
                    onTap: _googleLogin,
                    buttonType: ButtonType.google,
                    mini: true,
                  ),
                  FlutterSocialButton(
                    onTap: () {
                      setState(() async {
                        await services.siginWithOAuth(
                            'apple.com', ['email'], {'locale': 'en'});
                      });
                    },
                    buttonType: ButtonType.apple,
                    mini: true,
                  ),
                  FlutterSocialButton(
                    onTap: () {
                      setState(() async {
                        await services.siginWithOAuth(
                            'github.com', ['email'], {'locale': 'en'});
                      });
                    },
                    buttonType: ButtonType.github,
                    mini: true,
                  ),
                ],
              ),
            ),
            VerticalBox(size: 57),
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
                    ontap: () {
                      Navigator.of(context).pop();
                    },
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

  void _userLogin() async {
    await services.signin().whenComplete(() => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const MainPage();
        })));
  }

  void _googleLogin() async {
    User? user = await services.signInGoogle().whenComplete(
        () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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
}

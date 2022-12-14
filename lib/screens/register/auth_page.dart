import 'package:flutter/material.dart';
import 'package:music_app/screens/register/login.dart';
import 'package:music_app/screens/register/sigin_in.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

bool showLoginPage = true;

class _AuthPageState extends State<AuthPage> {
  void toogleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignInScreen(
        showSignPage: toogleScreen,
      );
    } else {
      return LoginScreen(
        showLoginPage: toogleScreen,
      );
    }
  }
}

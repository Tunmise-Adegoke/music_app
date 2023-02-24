import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/home/home_page.dart';
import 'package:music_app/screens/register/auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const SnackBar(content: Text('Something went wrong'));
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}

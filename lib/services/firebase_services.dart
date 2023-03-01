import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_app/screens/register/sigin_in.dart';
import 'package:music_app/util/text_editing_ctrl.dart';
import 'package:music_app/util/toast.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuthOAuth _authOAuth = FirebaseAuthOAuth();
  final TextEditCtrl myController = TextEditCtrl();

  Future<User?> signInGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;
      final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(oAuthCredential);
      return userCredential.user;
    } on PlatformException catch (e) {
      Toast(message: '${e.message}');
    }
    return null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> login() async {
    try {
      _auth.createUserWithEmailAndPassword(
        email: myController.loginEmailC.text.trim(),
        password: myController.loginPassC.text.trim(),
      );
    } on PlatformException catch (e) {
      Toast(message: '${e.message}');
      debugPrint('${e.message}');
    }
  }

  Future<void> signin() async {
    try {
      _auth.signInWithEmailAndPassword(
        email: myController.signInEmailC.text.trim(),
        password: myController.signInPassC.text.trim(),
      );
    } on PlatformException catch (e) {
      debugPrint('${e.message}');
      Toast(message: '${e.message}');
    }
  }

  Future<void> siginWithOAuth(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      _authOAuth.linkExistingUserWithCredentials(
        provider,
        scopes,
        parameters,
      );
    } on PlatformException catch (e) {
      debugPrint('${e.message}');
      Toast(message: '${e.message}');
    }
  }

  Future<void> loginWithOAuth(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      _authOAuth.linkWithOAuth(provider, scopes, parameters);
    } on PlatformException catch (e) {
      debugPrint('${e.message}');
      Toast(message: '${e.message}');
    }
  }
}

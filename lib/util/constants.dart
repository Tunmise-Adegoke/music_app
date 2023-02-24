import 'package:flutter/material.dart';
import 'package:music_app/widget/custom_text.dart';



class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
        content: CustomText(
      text: text,
    ));

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

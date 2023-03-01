import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Toast extends StatelessWidget {
  final String message;
  const Toast({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
       backgroundColor: const Color(0xFF303030),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
    )..show(context);
  }
}


 // static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  // static showSnackBar(String? text) {
  //   if (text == null) return;
  //   final snackBar = SnackBar(
  //       content: CustomText(
  //     text: text,
  //   ));

  //   messengerKey.currentState!
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }
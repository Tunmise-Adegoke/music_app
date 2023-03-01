import 'package:flutter/material.dart';

class TextEditCtrl {
  final TextEditingController signInEmailC = TextEditingController();
  final TextEditingController signInPassC = TextEditingController();
  final TextEditingController loginEmailC = TextEditingController();
  final TextEditingController loginPassC = TextEditingController();
  final TextEditingController nameC = TextEditingController();

  get signEmail => signInEmailC;
  get signPass => signInPassC;
  get loginEmail => loginEmailC;
  get loginPass => loginPassC;
  get name => nameC;

  void dispose() {
    signInEmailC.dispose();
    signInPassC.dispose();
    loginEmailC.dispose();
    loginPassC.dispose();
    nameC.dispose();
  }
}

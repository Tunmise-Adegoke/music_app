import 'dart:core';

import 'package:flutter/cupertino.dart';

class AppSize {
  BuildContext context;
  double designWidth = 390;
  double designHeight = 844;
  late double screenHeight;
  late double screenWidth;
  AppSize(this.context) {
    MediaQueryData queryData = MediaQuery.of(context);
    screenHeight = queryData.size.height;
    screenWidth = queryData.size.width;
  }
  sizeHeightPercent(double size) {
    double sizeHeight = size / designHeight;
    return screenHeight * sizeHeight;
  }

  sizeWidthPercent(double size) {
    double sizeWidth = size / designWidth;
    return screenWidth * sizeWidth;
  }
}

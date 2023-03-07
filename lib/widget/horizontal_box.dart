// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:music_app/util/dimensions.dart';

// ignore: must_be_immutable
class HorizontalBox extends StatelessWidget {
  double size;
  HorizontalBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSize as = AppSize(context);
    return SizedBox(
      width: as.wp(size),
    );
  }
}

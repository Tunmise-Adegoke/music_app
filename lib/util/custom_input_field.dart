import 'package:flutter/material.dart';
import 'package:music_app/util/app_colors.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final FontWeight fontWeight;
  final double size;
  final Color color;
  const InputField({
    Key? key,
    required this.hint,
    this.controller,
    this.widget,
    this.fontWeight = FontWeight.w500,
    this.size = 14,
    this.color = AppColors.lightGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const SizedBox(height: 10),
    return Container(
      height: 80,
      padding: const EdgeInsets.only(left: 14, right: 14),
      margin: const EdgeInsets.only(left: 28, right: 28),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: widget == null ? false : true,
              controller: controller,
              cursorColor: AppColors.primaryGreen,
              autofocus: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: color,
                  fontFamily: 'Satoshi',
                  fontWeight: fontWeight,
                  fontSize: size,
                ),

                // focusedBorder: const UnderlineInputBorder(
                //   borderSide: BorderSide(
                //     color: AppColors.primaryGreen,
                //     width: 0,
                //   ),
                // ),
                // enabledBorder: const UnderlineInputBorder(
                //   borderSide: BorderSide(
                //     color: AppColors.primaryGreen,
                //     width: 0,
                //   ),
                // ),
              ),
            ),
          ),
          widget == null ? Container() : Container(child: widget),
        ],
      ),
    );
    //     ],
    //   ),
    // );
  }
}

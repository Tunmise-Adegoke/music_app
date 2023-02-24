


import 'package:flutter/material.dart';
import 'package:music_app/util/app_colors.dart';
import 'package:music_app/widget/custom_text.dart';
import 'package:music_app/widget/horizontal_box.dart';
import 'package:music_app/widget/vertical_box.dart';

import '../widget/playlist_card.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.primaryGreen,
          ),
          VerticalBox(size: 11),
          const CustomText(text: 'kolote5230@bymercy.com'),
          VerticalBox(size: 8),
          const CustomText(text: 'Sorowhater'),
          VerticalBox(size: 18),
          Row(
            children: [
              CustomText(text: 778.toString()),
              HorizontalBox(size: 128),
              CustomText(text: 243.toString()),
            ],
          ),
          VerticalBox(size: 40),
          const CustomText(text: 'PUBLIC PLAYLIST'),
          VerticalBox(size: 17 ),
           SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return const PlaylistCard();
                  })),
            )
        ],
      ) ,
    );
  }
}
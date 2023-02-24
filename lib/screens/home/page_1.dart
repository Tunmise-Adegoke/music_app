import 'package:flutter/material.dart';
import 'package:music_app/widget/playlist_card.dart';
import 'package:music_app/widget/song_card.dart';
import 'package:music_app/widget/vertical_box.dart';

import '../../widget/custom_text.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              height: 300,
              width: double.maxFinite,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const SongCard();
                },
              ),
            ),
            VerticalBox(size: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(
                    text: 'Playlist',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    size: 20,
                  ),
                  CustomText(
                    text: 'See More',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    size: 12,
                  ),
                ],
              ),

            ),
            VerticalBox(size: 3),
            SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return const PlaylistCard();
                  })),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:music_app/screens/music_page.dart';
import 'package:music_app/util/dimensions.dart';
import 'package:music_app/widget/custom_back_button.dart';
import 'package:music_app/widget/custom_text.dart';
import 'package:music_app/widget/horizontal_box.dart';
import 'package:music_app/widget/vertical_box.dart';

import '../widget/custom_icon.dart';
import '../widget/playlist_card.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    AppSize as = AppSize(context);
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  const CustomText(text: 'Billie Ellish'),
                  VerticalBox(size: 6),
                  const CustomText(text: '2 Album, 67 track'),
                  VerticalBox(size: 10),
                  const CustomText(
                      text:
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis adipiscing vestibulum orci enim, nascetur vitae '''),
                  VerticalBox(size: 10),
                  const CustomText(text: 'Album'),
                  VerticalBox(size: 10),
                  SizedBox(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              Container(
                                height: as.hp(135),
                                width: as.wp(140),
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Billie Eilish - Bad Guy.jpg'),
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              VerticalBox(size: 10),
                              const CustomText(text: 'Happier Than Ever')
                            ],
                          );
                        }),
                        separatorBuilder: ((context, index) {
                          return HorizontalBox(size: 16);
                        }),
                        itemCount: 5),
                  ),
                  VerticalBox(size: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(text: 'Songs'),
                      CustomText(text: 'See More'),
                    ],
                  ),
                  SizedBox(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return const PlaylistCard();
                        })),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              child: Container(
            height: as.hp(240),
            width: as.wp(390),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(69),
                bottomLeft: Radius.circular(69),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/Billie Eilish - Bad Guy.jpg'),
              ),
            ),
          )),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  HorizontalBox(size: 100),
                  const CustomIcon(
                    icon: Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

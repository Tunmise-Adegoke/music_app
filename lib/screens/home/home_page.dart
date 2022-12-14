import 'package:flutter/material.dart';
import 'package:music_app/screens/home/page_1.dart';
import 'package:music_app/screens/home/page_2.dart';
import 'package:music_app/screens/home/page_3.dart';
import 'package:music_app/util/custom_text.dart';

import '../../util/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 100),
                Image.asset('assets/images/icons/Vector (2).png'),
              ],
            ),
          ),
          const SizedBox(height: 36),
          Container(
            height: 120,
            width: 450,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            margin: const EdgeInsets.symmetric(horizontal: 28),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.primaryGreen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10),
                    CustomText(
                      text: 'New Album',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    CustomText(
                      text: 'Happier Than',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      size: 22,
                    ),
                    CustomText(
                      text: 'Ever',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      size: 22,
                    ),
                    CustomText(
                      text: 'Billie Eilish',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
                GestureDetector(
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.primaryWhite,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          TabBar(
            controller: _pageController,
            indicatorColor: AppColors.primaryGreen,
            unselectedLabelColor: AppColors.lightGrey,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Satoshi',
            ),
            tabs: const [
              Tab(text: 'News'),
              Tab(text: 'Videos'),
              Tab(text: 'Artist'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _pageController,
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_app/screens/artist_page.dart';
import 'package:music_app/screens/home/home_page.dart';
import 'package:music_app/screens/lyrics.dart';
import 'package:music_app/screens/users_page.dart';
import 'package:music_app/util/app_colors.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  State<HomeNav> createState() => _HomeNavState();
}

List<Widget> screens = [
  const HomeScreen(),
  const LyricsPage(),
  const ArtistPage(),
  UserProfilePage(),
];

class _HomeNavState extends State<HomeNav> {
  int _selectedScreen = 0;
  void _onScreentapped(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Hicons.home_1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Hicons.discovery_1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Hicons.heart_1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Hicons.profile_1),
            label: '',
          ),
        ],
        iconSize: 20,
        currentIndex: _selectedScreen,
        selectedItemColor: AppColors.primaryGreen,
        onTap: _onScreentapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_app/screens/artist_page.dart';
import 'package:music_app/screens/home/home_page.dart';
import 'package:music_app/screens/lyrics.dart';
import 'package:music_app/screens/users_page.dart';
import 'package:music_app/util/app_colors.dart';

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
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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

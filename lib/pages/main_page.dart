import 'package:flutter/material.dart';
import 'package:intern_project/pages/HomePage.dart';
import 'package:intern_project/pages/Profile%20Page.dart';
import 'package:intern_project/pages/Store_Page.dart';
import 'package:intern_project/pages/feed_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/svg/home.png', height: 24, width: 24,), label:'Home'),
          BottomNavigationBarItem(icon: Image.asset('assets/svg/feed.png', height: 24, width: 24,), label:'Feed'),
          BottomNavigationBarItem(icon: Image.asset('assets/svg/store1.png', height: 24, width: 24,), label:'Store'),
          BottomNavigationBarItem(icon: Image.asset('assets/svg/person.png', height: 24, width: 24,), label:'profile'),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  final pages = [
    Homepage() ,
    FeedPage(),
    StorePage(),
    ProfilePage(),
  ];
}

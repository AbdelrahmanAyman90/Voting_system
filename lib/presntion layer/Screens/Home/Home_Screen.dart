import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_page_of_voting/Home2.dart';
import 'package:voting/presntion%20layer/Screens/Profile/profile.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/result_screen.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteing_screen.dart';
import 'package:voting/Shared/Colors.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int _selectedIndex = 0;
  static final List<Widget> items_clicked = <Widget>[
    const Home2(),
    const VoteingScreenn(),
    const ResultScreen(),
    const profile(),
  ];

  // void onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items_clicked.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.how_to_vote_outlined),
            label: S.of(context).vote,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.stacked_bar_chart_sharp),
            label: S.of(context).result,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: S.of(context).profile,
          ),
        ],
        currentIndex: _selectedIndex, //index now
        onTap: (index) =>
            setState(() => _selectedIndex = index), //function to chsnge screen
      ),
    );
  }
}

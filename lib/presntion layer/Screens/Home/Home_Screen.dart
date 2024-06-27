import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/bottom_navgiation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const BottomNavgiationBarWidget(
      select: null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_tab_bar.dart';

class CustomContainerTabBar extends StatefulWidget {
  const CustomContainerTabBar({super.key, required this.controller});
  final TabController controller;

  @override
  State<CustomContainerTabBar> createState() => _CustomContainerTabBarState();
}

class _CustomContainerTabBarState extends State<CustomContainerTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: MediaQuery.of(context).size.width * 335 / 375,
        // height: MediaQuery.of(context).size.height * 55 / 812,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTabBar(controller: widget.controller),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_container_tab_bar.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_tab_bar.dart';

class CustomBottomContainer extends StatefulWidget {
  const CustomBottomContainer({
    super.key,
    required this.controller,
    required this.date,
  });
  final TabController controller;
  final String? date;

  @override
  State<CustomBottomContainer> createState() => _CustomBottomContainerState();
}

class _CustomBottomContainerState extends State<CustomBottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomContainerTabBar(controller: widget.controller),
          ),
          Expanded(
              child: CustomTabBarBage(
                  controller: widget.controller, date: widget.date)),
        ],
      ),
    );
  }
}

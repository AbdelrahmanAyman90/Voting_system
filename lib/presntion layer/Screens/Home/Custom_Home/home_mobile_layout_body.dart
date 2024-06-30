import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_bottom_container.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_top_container.dart';

class HomeMobileLayoutBody extends StatefulWidget {
  const HomeMobileLayoutBody({super.key});

  @override
  State<HomeMobileLayoutBody> createState() => _HomeMobileLayoutBodyState();
}

class _HomeMobileLayoutBodyState extends State<HomeMobileLayoutBody>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 2, child: CustomTopContainer()),
        Expanded(
          flex: 3,
          child: CustomBottomContainer(
            controller: _controller,
          ),
        ),
      ],
    );
  }
}

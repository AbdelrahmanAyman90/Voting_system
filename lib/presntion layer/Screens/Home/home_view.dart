import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:voting/Shared/adaptive_layout.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/home_mobile_layout_body.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/home_tablet_layout_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600
        ? SafeArea(
            child: AdaptiveLayout(
              mobileLayout: (context) => const HomeMobileLayoutBody(),
              tabletLayout: (context) => const HomeTabletLayoutBody(),
              desktopLayout: (context) => const Text('desktop layout'),
            ),
          )
        : AdaptiveLayout(
            mobileLayout: (context) => const HomeMobileLayoutBody(),
            tabletLayout: (context) => const HomeTabletLayoutBody(),
            desktopLayout: (context) => const Text('desktop layout'),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/presntion%20layer/Screens/Drawer/drawer_items_list_view.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/home_mobile_layout_body.dart';
import 'package:voting/presntion%20layer/Screens/Profile/profile_mobile_layout.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/result_mobile_layout.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteing_mobile_layout.dart';

class HomeTabletLayoutBody extends StatefulWidget {
  const HomeTabletLayoutBody({super.key});

  @override
  State<HomeTabletLayoutBody> createState() => _HomeTabletLayoutBodyState();
}

class _HomeTabletLayoutBodyState extends State<HomeTabletLayoutBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomDrawer(
              activeIndex: selectedIndex,
              onItemSelected: (index) => setState(() => selectedIndex = index),
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: IndexedStack(
                    index: selectedIndex,
                    children: const [
                      HomeMobileLayoutBody(),
                      VoteingMobileLayoutBody(),
                      ResultMobileLayoutBody(),
                      ProfileMobileLayoutBody(),
                    ],
                  ),
                ),
              )),
          const SizedBox(
            width: 32,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/home_view.dart';
import 'package:voting/presntion%20layer/Screens/Profile/profile_mobile_layout.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/result_mobile_layout.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteing_mobile_layout.dart';

class BottomNavgiationBarWidget extends StatefulWidget {
  const BottomNavgiationBarWidget({super.key, required this.select});
  final int? select;
  @override
  State<BottomNavgiationBarWidget> createState() =>
      _BottomNavgiationBarWidgetState();
}

class _BottomNavgiationBarWidgetState extends State<BottomNavgiationBarWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.select ?? 0;
  }

  static final List<Widget> itemsClicked = <Widget>[
    const HomeView(),
    const VoteingMobileLayoutBody(),
    const ResultMobileLayoutBody(),
    const ProfileMobileLayoutBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: itemsClicked.elementAt(_selectedIndex),
        bottomNavigationBar: MediaQuery.sizeOf(context).width < 600
            ? BottomNavigationBar(
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
                currentIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
              )
            : null);
  }
}

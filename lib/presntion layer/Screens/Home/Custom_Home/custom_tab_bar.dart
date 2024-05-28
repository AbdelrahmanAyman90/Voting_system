import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_candidate_page_in_election_period.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_candidate_page_in_nomination_period.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_event_page.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.controller});

  final TabController controller;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.white,
        indicator: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColors.tabBarColor),
        controller: widget.controller,
        tabs: [
          Tab(
            child: Text(
              S.of(context).event_word,
              style: TextStyle(color: AppColors.mainColor),
            ),
          ),
          Tab(
            child: Text(
              S.of(context).candidate_word,
              style: TextStyle(color: AppColors.mainColor),
            ),
          ),
        ]);
  }
}

class CustomTabBarBage extends StatefulWidget {
  const CustomTabBarBage(
      {super.key, required this.controller, required this.date});
  final TabController controller;
  final String? date;

  @override
  State<CustomTabBarBage> createState() => _CustomTabBarBageState();
}

class _CustomTabBarBageState extends State<CustomTabBarBage> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.controller,
      children: [
        const CustomEventPage(),
        widget.date == '40'
            ? const CustomCandidatesPageInNomination()
            : const CustomCandidatePageInElection(),
      ],
    );
  }
}

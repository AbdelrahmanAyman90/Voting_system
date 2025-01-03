import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/service_locator.dart';
import 'package:voting/Shared/shareWidget/stuts_app.dart';
import 'package:voting/data/repository/candidate/candidate_repo_implemntion.dart';
import 'package:voting/data/repository/preparapp/prepar_app_repo_implment.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_candidate_page_in_election_period.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_candidate_page_in_nomination_period.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_event_page.dart';
import 'package:voting/presntion%20layer/view_model/check_iscandidate_viewmodel/cubit/cheack_is_candidate_cubit.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_info_biewmodel/cubit/get_candidate_info_cubit.dart';

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
  const CustomTabBarBage({super.key, required this.controller});
  final TabController controller;

  @override
  State<CustomTabBarBage> createState() => _CustomTabBarBageState();
}

class _CustomTabBarBageState extends State<CustomTabBarBage> {
  void navigateToCandidates() {
    widget.controller.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        if (state is EventSuccses) {
          return TabBarView(
            controller: widget.controller,
            children: [
              BlocProvider(
                create: (context) =>
                    CheackIsCandidateCubit(getIt.get<PreparAppRepoImplemnt>()),
                child: CustomEventPage(
                  controller: navigateToCandidates,
                  eventDate: state.event,
                ),
              ),
              context.read<EventCubit>().eventCases("candidates") == "now" ||
                      context.read<EventCubit>().eventCases("elections") ==
                          "now" ||
                      context.read<EventCubit>().eventCases("elections") ==
                          "end"
                  ? const CustomCandidatePageInElection()
                  : const CustomCandidatesPageInNomination(),
            ],
          );
        } else if (state is EventFail) {
          return Center(
            child: Text(
              state.errorMassage,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          );
        } else if (state is EventLooding || state is EventInitial) {
          return ListView.builder(
            itemBuilder: (context, index) => buildShammerWidget(),
            itemCount: 3,
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) => buildShammerWidget(),
            itemCount: 3,
          );
        }
      },
    );
  }
}

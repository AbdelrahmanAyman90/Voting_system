// import 'package:flutter/material.dart';
// import 'package:scroll_to_hide/scroll_to_hide.dart';
// import 'package:voting/Shared/const/Colors.dart';
// import 'package:voting/Shared/const/Fonts.dart';
// import 'package:voting/Shared/shareWidget/button.dart';
// import 'package:voting/generated/l10n.dart';

// class test extends StatefulWidget {
//   const test({super.key});

//   @override
//   State<test> createState() => _testState();
// }

// class _testState extends State<test> {
//   ScrollController controller = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(kToolbarHeight),
//         child: Padding(
//           padding: const EdgeInsets.only(right: 20),
//           child: AppBar(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 color: AppColors.mainColor,
//                 size: 20,
//               ),
//             ),
//             title: Text(
//               'candidat',
//               style: AppFonts.boldText(context, 18, AppColors.mainColor),
//             ),
//             centerTitle: true,
//             actions: [buildBodyAppBar()],
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               controller: controller,
//               itemCount: 100,
//               itemBuilder: (context, index) {
//                 return ListTile(title: Text('Item #$index'));
//               },
//             ),
//           ),
//           _buildVotingButton(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildVotingButton(BuildContext context) {
//     return Positioned(
//       bottom: 50,
//       left: 0,
//       right: 0,
//       child: Center(
//         child: ScrollToHide(
//           hideDirection: Axis.vertical,
//           scrollController: controller,
//           child: ButtonWidget(
//             onPressed: () {},
//             color: AppColors.mainColor,
//             textcolor: Colors.white,
//             word: S.of(context).voting_button,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildBodyAppBar() {
//     return SizedBox(
//       height: 35,
//       child: TextButton(
//         style: TextButton.styleFrom(
//           backgroundColor: AppColors.mainColor,
//           // primary: Colors.white,

//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         onPressed: () {},
//         child: Text(
//           S.of(context).vote_vutton,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';
import 'package:shimmer/shimmer.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shareWidget/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirm_voteing_screen.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/custom_candidate_widget.dart';
import 'package:voting/presntion%20layer/view_model/cheack_isvoted_viewmodel/cubit/check_is_voted_cubit.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_viewmodel/cubit/get_candidate_cubit.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class VotingBody extends StatefulWidget {
  const VotingBody({super.key});

  @override
  State<VotingBody> createState() => _VotingBodyState();
}

class _VotingBodyState extends State<VotingBody> {
  int _selectedIndex = -1;
  ScrollController controller = ScrollController();

  Future<void> _checkIsUserVoted() async {
    if (context.read<CheckIsVotedCubit>().isUserVoted == null &&
        context.read<EventCubit>().eventCases("elections") == "now") {
      await context.read<CheckIsVotedCubit>().isVoted();
    }
  }

  @override
  Widget build(BuildContext context) {
    log("when enter to page the value of isvoted--->${context.read<CheckIsVotedCubit>().isUserVoted.toString()}");

    return FutureBuilder<void>(
      future: _checkIsUserVoted(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return BlocBuilder<CheckIsVotedCubit, CheckIsVotedState>(
            builder: (context, state) {
              if (state is CheackIsUserVotedLooding) {
                return const BuildCandidategShimmer();
              } else if (state is CheackIsUserVoteFail) {
                return Center(
                  child: Text(
                    state.errorMassage,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              } else {
                return Stack(
                  children: [
                    Container(
                      color: AppColors.backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            // Hint
                            Text(
                              S.of(context).hint_to_select_candidate,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 18),
                            // List candidate
                            _buildCandidates(context),
                          ],
                        ),
                      ),
                    ),
                    if (context.read<EventCubit>().eventCases("elections") ==
                            "now" &&
                        context.read<CheckIsVotedCubit>().isUserVoted == false)
                      _buildVotingButton(context),
                  ],
                );
              }
            },
          );
        }
      },
    );
  }

  Widget _buildCandidates(BuildContext context) {
    return BlocBuilder<GetCandidateCubit, GetCandidateState>(
      builder: (context, state) {
        if (state is GetCandidateSuccess) {
          return Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item #$index'));
              },
            ),
          );
        } else if (state is GetCandidateFail) {
          return Center(child: Text(state.errorMassage));
        } else {
          return const BuildCandidategShimmer();
        }
      },
    );
  }

  void _selectCandidate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildVotingButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ScrollToHide(
        hideDirection: Axis.vertical,
        scrollController: controller,
        duration: Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ButtonWidget(
            onPressed: () {
              _selectedIndex == -1
                  ? MyAppStuts.showSnackBar(
                      context,
                      S
                          .of(context)
                          .error_to_should_choose_candatae_in_voting_screen,
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmVoteScreen(
                          selectIndex: _selectedIndex,
                        ),
                      ),
                    );
            },
            color: AppColors.mainColor,
            textcolor: Colors.white,
            word: S.of(context).voting_button,
          ),
        ),
      ),
    );
  }
}

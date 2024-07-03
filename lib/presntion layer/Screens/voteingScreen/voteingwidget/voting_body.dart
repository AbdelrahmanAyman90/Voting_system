import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    context.read<EventCubit>().eventCases("elections") ==
                                "now" &&
                            context.read<CheckIsVotedCubit>().isUserVoted ==
                                false
                        ? _buildVotingButton(context)
                        : const SizedBox()
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
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _selectCandidate(index),
                  child: ShowCandidate(
                    isSelected: _selectedIndex == index,
                    bio: state.allCandidate[index].job!,
                    name: state.allCandidate[index].name!,
                    image: state.allCandidate[index].image!,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.allCandidate.length,
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
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Center(
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
    );
  }
}

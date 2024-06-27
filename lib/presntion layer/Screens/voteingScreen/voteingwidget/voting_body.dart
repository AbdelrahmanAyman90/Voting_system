import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shard%20local/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirm_voteing_screen.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/custom_candidate_widget.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_viewmodel/cubit/get_candidate_cubit.dart';

class VotingBody extends StatefulWidget {
  const VotingBody({super.key});

  @override
  State<VotingBody> createState() => _VotingBodyState();
}

class _VotingBodyState extends State<VotingBody> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                //hint
                Text(
                  S.of(context).hint_to_select_candidate,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 18),
                //list candidate
                _buildCandidates(
                  context,
                ),
              ],
            ),
          ),
        ),
        eventCases("elections") == "now"
            ? _buildVotingButton(context)
            : SizedBox()
      ],
    );
  }

/*

widget function
|||||||||||||||||||||||||||||||||||||



 */
  void _selectCandidate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//! build candidate contaner
  Widget _buildCandidates(
    BuildContext context,
  ) {
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
          return Center(
              child: Center(
                  child: CircularProgressIndicator(
            color: AppColors.mainColor,
          )));
        }
      },
    );
  }

//! build Confirm voting button
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
                        .error_to_should_choose_candatae_in_voting_screen)
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

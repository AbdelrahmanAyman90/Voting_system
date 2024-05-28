import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirm_voteing_screen.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/custom_candidate_widget.dart';

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
                Text(
                  S.of(context).presidential_elections,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.mainColor,
                  ),
                ),
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
                _buildCandidates(context),
              ],
            ),
          ),
        ),
        _buildVotingButton(context),
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

  Widget _buildCandidates(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _selectCandidate(index),
            child: ShowCandidate(
              isSelected: _selectedIndex == index,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        itemCount: 10,
      ),
    );
  }

  Widget _buildVotingButton(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Center(
        child: ButtonWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ConfirmVoteScreen()),
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

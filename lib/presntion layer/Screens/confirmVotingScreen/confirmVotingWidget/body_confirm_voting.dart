import 'package:flutter/material.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/coustom_password.dart';
import 'package:voting/presntion%20layer/Screens/thankesVotingScreen/thanks_voting_screen.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/custom_candidate_widget.dart';

class ConfirmVotingBody extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ConfirmVotingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ShowCandidate(
          isSelected: true,
        ),
        const SizedBox(height: 80),
        _buildPasswordSection(context),
        const SizedBox(height: 70),
        _buildConfirmButton(context),
        const SizedBox(height: 10),
        _buildCancelButton(context),
      ],
    );
  }

/*

wedgit fun

*/
  Widget _buildPasswordSection(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).enter_password,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Text(
          S.of(context).hint_password,
        ),
        const SizedBox(height: 18),
        Form(
          key: _formKey,
          child: const CustomPassowrdText(),
        ),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ButtonWidget(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ThankesToVoteScreen()),
            );
          }
        },
        word: S.of(context).confirm_voting_button,
        color: const Color(0xFF008753),
        textcolor: Colors.white,
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ButtonWidget(
        onPressed: () {
          Navigator.pop(context);
        },
        word: S.of(context).cancel_button,
        color: Colors.white,
        textcolor: const Color(0xFF008753),
      ),
    );
  }
}

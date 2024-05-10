import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/body_confirm_voting.dart';

class ConfirmVoteScreen extends StatelessWidget {
  const ConfirmVoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 18,
              color: Color(0xFF008753),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: ConfirmVotingBody(),
      ),
    );
  }
}

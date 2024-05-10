import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/voting_body.dart';

//! todo more refactor
class VoteingScreenn extends StatefulWidget {
  const VoteingScreenn({Key? key}) : super(key: key);

  @override
  _VoteingScreennState createState() => _VoteingScreennState();
}

class _VoteingScreennState extends State<VoteingScreenn> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: VotingBody(),
    );
  }

/*

widget function
|||||||||||


*/
  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          S.of(context).elesctions,
          style: TextStyle(
            fontSize: 28,
            color: AppColors.mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

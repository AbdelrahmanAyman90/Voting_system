import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/voting_body.dart';

//! todo more refactor
class VoteingMobileLayoutBody extends StatefulWidget {
  const VoteingMobileLayoutBody({Key? key}) : super(key: key);

  @override
  _VoteingMobileLayoutBodyState createState() =>
      _VoteingMobileLayoutBodyState();
}

class _VoteingMobileLayoutBodyState extends State<VoteingMobileLayoutBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      //isvoted
      body: const VotingBody(),
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
      toolbarHeight: 60,
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(S.of(context).elesctions,
            style: AppFonts.boldText(context, 24, AppColors.mainColor)),
        // Text(
        //   S.of(context).elesctions,
        //   style: TextStyle(
        //     fontSize: 28,
        //     color: AppColors.mainColor,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
      ),
    );
  }
}

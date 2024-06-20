// import 'package:flutter/material.dart';
// import 'package:voting/Shared/const/Colors.dart';
// import 'package:voting/Shared/const/Fonts.dart';
// import 'package:voting/generated/l10n.dart';
// import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/voting_body_nomination.dart';

// //! todo more refactor
// class ResultsScreennNomination extends StatefulWidget {
//   const ResultsScreennNomination({Key? key}) : super(key: key);

//   @override
//   _VoteingScreennState createState() => _VoteingScreennState();
// }

// class _VoteingScreennState extends State<ResultsScreennNomination> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(context),
//       body: const VotingBodyNomination(),
//     );
//   }

// /*

// widget function
// |||||||||||


// */
//   PreferredSizeWidget? _buildAppBar(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       backgroundColor: Colors.white,
//       elevation: 0,
//       toolbarHeight: 80,
//       title: Padding(
//           padding: const EdgeInsets.only(top: 15),
//           child: Text(
//             S.of(context).results,
//             style: AppFonts.boldText(context, 24, AppColors.mainColor),
//           )),
//     );
//   }
// }

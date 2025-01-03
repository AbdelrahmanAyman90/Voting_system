import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_candidate_profile.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirm_voteing_screen.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_info_biewmodel/cubit/get_candidate_info_cubit.dart';

class Candidates extends StatefulWidget {
  const Candidates({
    super.key,
    required this.candidateUserId,
    required this.candidateName,
    required this.selectCandidate,
    required this.cndidateSId,
  });

  final String candidateUserId;
  final String candidateName;
  final String cndidateSId;
  final int selectCandidate;

  @override
  State<Candidates> createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  bool _isLoading = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
//mount--->that indicates whether the state object is currently in the widget tree.
    _timer = Timer(Duration(seconds: 2), () async {
      if (!mounted) return;
      await context
          .read<GetCandidateInfoCubit>()
          .getSingleCandidateinfo(idCandidate: widget.cndidateSId);
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.mainColor,
                size: 20,
              ),
            ),
            title: Text(
              widget.candidateName,
              style: AppFonts.boldText(context, 18, AppColors.mainColor),
            ),
            centerTitle: true,
            actions: [buildBodyAppBar()],
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            )
          : CustomCandidatesProfile(
              isRealCandidate: widget.candidateUserId == idUser,
              isAddCampiagn:
                  context.read<GetCandidateInfoCubit>().isAddCam ?? false,
            ),
    );
  }

/**
 * 
 * widget
 * 
 */
//   Widget buildBodyAppBar() {
//     return Row(
//       //mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Text(
//           widget.candidateName,
//           style: AppFonts.boldText(context, 18, AppColors.mainColor),
//         ),
//         const Spacer(),
//         context.read<EventCubit>().eventCases("elections") == "now"
//             ? TextButton(
//                 style: TextButton.styleFrom(
//                   backgroundColor: AppColors.mainColor,
//                   // primary: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ConfirmVoteScreen(
//                         selectIndex: widget.selectCandidate,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   S.of(context).vote_vutton,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               )
//             : const SizedBox(),
//       ],
//     );
//   }
// }
  Widget buildBodyAppBar() {
    return context.read<EventCubit>().eventCases("elections") == "now"
        ? SizedBox(
            height: 35,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  // primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmVoteScreen(
                        selectIndex: widget.selectCandidate,
                      ),
                    ),
                  );
                },
                child: Text(
                  S.of(context).vote_vutton,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

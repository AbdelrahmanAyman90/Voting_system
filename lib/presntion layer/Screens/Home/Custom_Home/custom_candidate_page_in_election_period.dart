import 'package:flutter/material.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/candidates_list_widget.dart';

class CustomCandidatePageInElection extends StatelessWidget {
  const CustomCandidatePageInElection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            // width: MediaQuery.of(context).size.width * 335 / 375,
            // height: MediaQuery.of(context).size.height * 122 / 812,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CandidateList(
                img: 'assets/images/unsplash_pAtA8xe_iVM.png',
                name: S.of(context).candidate_name,
                bio: S.of(context).candidate_bio,
              ),
            ),
          ),
        );
      },
    );
  }
}

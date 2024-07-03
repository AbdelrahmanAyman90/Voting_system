import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shard%20local/service_locator.dart';
import 'package:voting/Shared/shareWidget/global_widget.dart';
import 'package:voting/data/repository/candidate/candidate_repo_implemntion.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/Candidate_profile.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_info_biewmodel/cubit/get_candidate_info_cubit.dart';

/**
 * 
 * list candidate 
 */
class CandidateList extends StatefulWidget {
  final String img;
  final String name;
  final String bio;
  final String candidateSId;
  final String userCandate;
  final int selectCandidate;

  const CandidateList(
      {super.key,
      required this.selectCandidate,
      required this.userCandate,
      required this.img,
      required this.bio,
      required this.name,
      required this.candidateSId});

  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => GetCandidateInfoCubit(
                  CandidateRepoImplemnt(apiServes: getIt.get<ApiServes>())),
              child: Candidates(
                cndidateSId: widget.candidateSId,
                candidateUserId: widget.userCandate,
                candidateName: widget.name,
                selectCandidate: widget.selectCandidate,
              ),
            ),
          ),
        );
      },
      child: Row(
        children: [
          //! image
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: imageContainer(widget.img),
          ),
          Expanded(
            //! name and job
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: AppFonts.regularText(context, 16, Colors.black),
                ),
                SizedBox(
                  height: isEnglish() ? 5 : 0,
                ),
                Text(
                  widget.bio,
                  maxLines: 2,
                  style: AppFonts.regularText(
                      //height: 1.5,
                      context,
                      12,
                      AppColors.secondaryTextColor),
                ),
              ],
            ),
          ),
//!arrow
          Icon(
            //todo english here
            isEnglish()
                ? Icons.keyboard_arrow_right
                : Icons.keyboard_arrow_left,
            size: 30,
            color: Color(0xFF008753),
          ),
        ],
      ),
    );
  }
}

/**
 * 
 * profile page
 * 
 */
//! profile here
class PersonalInfo extends StatelessWidget {
  final String? title;
  final String? desc;
  final double? width;
  const PersonalInfo(
      {super.key,
      required this.title,
      required this.desc,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title!,
          style: AppFonts.semiBoldText(
              context, isEnglish() ? 12 : 14, AppColors.navigationBarColor),
        ),
        SizedBox(
          width: width,
        ),
        Text(
          desc!,
          style: AppFonts.regularText(
              context, isEnglish() ? 12 : 14, AppColors.secondaryTextColor),
        )
      ],
    );
  }
}
//! profile here

class BioAndGoals extends StatelessWidget {
  final String title;
  final String desc;
  const BioAndGoals({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.boldText(
                  context, isEnglish() ? 12 : 14, AppColors.mainColor),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              desc,
              style: AppFonts.regularText(
                  context, 14, AppColors.secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
//! profile here

class AdditinalLink extends StatelessWidget {
  final String title;
  final String link;
  AdditinalLink({super.key, required this.title, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // width: MediaQuery.of(context).size.width * 335 / 375,
      // height: MediaQuery.of(context).size.height * 248 / 812,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.boldText(
                  context, isEnglish() ? 12 : 14, AppColors.mainColor),
            ),
            const SizedBox(
              height: 23,
            ),
            GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(link));
              },
              child: Text(
                link,
                style: AppFonts.regularText(context, 14, Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

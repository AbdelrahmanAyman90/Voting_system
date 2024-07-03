import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/upload_form.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/candidates_list_widget.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/personal_information_in_cnadidate_profile.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/video_in_candidate_profile.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_info_biewmodel/cubit/get_candidate_info_cubit.dart';

class CustomCandidatesProfile extends StatelessWidget {
  const CustomCandidatesProfile({
    super.key,
    required this.isAddCampiagn,
    required this.isRealCandidate,
  });
  final bool isAddCampiagn;
  final bool isRealCandidate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCandidateInfoCubit, GetCandidateInfoState>(
      builder: (context, state) {
        if (state is GetSingleCandidateSuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //todo if dont have compign show image here

                  buildImage(isAddCampiagn, isRealCandidate) == "show data" ||
                          buildImage(isAddCampiagn, isRealCandidate) ==
                              "not yet"
                      ? CachedNetworkImage(
                          imageUrl: imagePath +
                              state.candidateInfo.data!.candidate!.image!,
                          fit: BoxFit.fill,
                          height: 200,
                          width: double.infinity,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : VideoPlayer(
                          pathViedio:
                              state.candidateInfo.data!.campaign!.video!),

                  const SizedBox(
                    height: 16,
                  ),
                  //todo show information here if have compign and not have

                  PersonalInfoInCandidateProfile(
                    candidateData: state.candidateInfo.data?.candidate,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //todo show button if dont have compign

                  isAddCampiagn
                      ? Column(
                          children: [
                            BioAndGoals(
                                title: S.of(context).bio_titel,
                                desc: state.candidateInfo.data!.campaign!.bio!),
                            const SizedBox(
                              height: 16,
                            ),
                            BioAndGoals(
                                title: S.of(context).goal_titel,
                                desc:
                                    state.candidateInfo.data!.campaign!.goals!),
                            const SizedBox(
                              height: 16,
                            ),
                            state.candidateInfo.data!.campaign!.link != null
                                ? AdditinalLink(
                                    title: S.of(context).add_link,
                                    link: state
                                        .candidateInfo.data!.campaign!.link!)
                                : const SizedBox(),
                          ],
                        )
                      //part of show button if same candidate is same user to add camp
                      : context.read<EventCubit>().eventCases("candidates") ==
                              "now"
                          ? buildImage(isAddCampiagn, isRealCandidate) ==
                                  "show data"
                              ? ButtonWidget(
                                  word: S.of(context).add_camp,
                                  color: AppColors.mainColor,
                                  textcolor: Colors.white,
                                  //!Add campiagn
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AddCampaignScreen()),
                                    );
                                  },
                                )
                              : Center(
                                  child: Text(
                                  S.of(context).not_add_camp,
                                  style: const TextStyle(fontSize: 28),
                                ))
                          : const SizedBox(),
                ],
              ),
            ),
          );
        } else if (state is GetSingleCandidateFail) {
          return Center(child: Text(state.errorMassage));
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ));
        }
      },
    );
  }

  String buildImage(bool isRealAddCampiagn, bool isRealCndidate) {
    if (isRealCandidate && !isRealAddCampiagn) {
      return "show data";
    } else if (isRealAddCampiagn) {
      return "show compiagn";
    } else {
      return "not yet";
    }
  }
}

// candidate , campaign
// if campaign => show campaign
// if not campaign - tow cases
// case 1: if candidate.user == user._id => show add campaign button
// case 2: else => show "not add campaign yet
import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/candidates_list_widget.dart';

class PersonalInfoInCandidateProfile extends StatelessWidget {
  const PersonalInfoInCandidateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 335 / 375,
      // height: MediaQuery.of(context).size.height * 248 / 812,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(
            top: 20,
            left: isEnglish() ? 20 : 0,
            right: isEnglish() ? 0 : 20,
            bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).personal_information,
              style: AppFonts.boldText(
                  context, isEnglish() ? 12 : 14, AppColors.mainColor),
            ),
            SizedBox(
              height: isEnglish() ? 23 : 20,
            ),
            PersonalInfo(
                title: S.of(context).titel_name,
                desc: S.of(context).candidate_name,
                width: 42),
            const SizedBox(
              height: 16,
            ),
            PersonalInfo(
                title: S.of(context).age_title,
                desc: S.of(context).age_desc,
                width: 53),
            const SizedBox(
              height: 16,
            ),
            PersonalInfo(
              title: S.of(context).education_title,
              desc: S.of(context).education_desc,
              width: isEnglish() ? 16 : 40,
            ),
            const SizedBox(
              height: 16,
            ),
            PersonalInfo(
              title: S.of(context).job_title,
              desc: S.of(context).job_desc,
              width: isEnglish() ? 55 : 38,
            ),
            const SizedBox(
              height: 16,
            ),
            PersonalInfo(
              title: S.of(context).location_title,
              desc: S.of(context).location_desc,
              width: isEnglish() ? 24 : 50,
            ),
          ],
        ),
      ),
    );
  }
}
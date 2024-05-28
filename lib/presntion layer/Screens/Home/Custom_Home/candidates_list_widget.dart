import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/Candidate_profile.dart';

class CandidateList extends StatefulWidget {
  final String img;
  final String name;
  final String bio;

  const CandidateList(
      {super.key, required this.img, required this.bio, required this.name});

  @override
  State<CandidateList> createState() => _CandidateListState();
}

class _CandidateListState extends State<CandidateList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
                image: AssetImage(
              widget.img,
            )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: isEnglish() ? 0 : 10,
              left: isEnglish() ? 10 : 0,
              right: isEnglish() ? 0 : 10,
            ),
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
                Padding(
                  padding: EdgeInsets.only(bottom: isEnglish() ? 0 : 10),
                  child: SizedBox(
                    //height: 30,
                    child: Align(
                      alignment: isEnglish()
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const Candidates(),
                              ),
                            );
                          },
                          child: Text(
                            S.of(context).read_more,
                            style: AppFonts.boldText(
                                context, 12, AppColors.secondaryTextColor),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PersonalInfo extends StatelessWidget {
  final String title;
  final String desc;
  final double width;
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
          title,
          style: AppFonts.semiBoldText(
              context, isEnglish() ? 12 : 14, AppColors.navigationBarColor),
        ),
        SizedBox(
          width: width,
        ),
        Text(
          desc,
          style: AppFonts.regularText(
              context, isEnglish() ? 12 : 14, AppColors.secondaryTextColor),
        )
      ],
    );
  }
}

class BioAndGoals extends StatelessWidget {
  final String title;
  final String desc;
  const BioAndGoals({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
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

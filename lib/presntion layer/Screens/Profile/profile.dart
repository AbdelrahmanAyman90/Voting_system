import 'package:flutter/material.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/row_2.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/Shard_Profile.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/row_2_dark_mode.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 20 / 375,
                  vertical: MediaQuery.of(context).size.height * 20 / 812),
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: AppColors.mainColor,
                      radius: 25,
                      child: Text(
                          //todo api
                          S.of(context).name_personal.isNotEmpty
                              ? S.of(context).name_personal[0].toUpperCase()
                              : "",
                          style: AppFonts.boldText(
                              fontSize: 24, color: Colors.white))),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).name_personal,
                        style: AppFonts.semiBoldText(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        S.of(context).verified,
                        style: AppFonts.regularText(
                            fontSize: 12, color: AppColors.mainColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            profile_Info(
              title: S.of(context).personal_details,
              icon1: Icons.perm_identity_rounded,
              //todo api
              text1: S.of(context).full_name_personal,
              icon2: Icons.assignment_ind_outlined,
              //todo api
              text2: S.of(context).id,
              icon3: Icons.calendar_month_outlined,
              //todo api
              text3: S.of(context).date,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 170,
              width: double.infinity,
              color: AppColors.eventButtonColor,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).settings,
                      style: AppFonts.semiBoldText(
                          fontSize: 16, color: AppColors.mainColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    row2_in_profile_dark_mode(
                      icon: Icons.dark_mode_outlined,
                      text: S.of(context).dark_mode,
                    ),
                    row2_in_profile(
                      icon: Icons.language,
                      text: S.of(context).english,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            profile_Info(
              title: S.of(context).more_details,
              icon1: Icons.help_outline_outlined,
              icon2: Icons.logout,
              icon3: Icons.share,
              text1: S.of(context).get_help,
              text2: S.of(context).log_out,
              text3: S.of(context).share,
            ),
          ],
        ),
      ),
    );
  }
}

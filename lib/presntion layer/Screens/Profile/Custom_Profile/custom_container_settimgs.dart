import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/row_2.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/row_2_dark_mode.dart';

class CustomContainerSettings extends StatelessWidget {
  const CustomContainerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 170,
      width: double.infinity,
      color: AppColors.profilebackgroundcolor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).settings,
              style: AppFonts.semiBoldText(context, 16, AppColors.mainColor),
            ),
            const SizedBox(
              height: 10,
            ),
            row2_in_profile_dark_mode(
              icon: Icons.dark_mode_outlined,
              text: S.of(context).dark_mode,
            ),
            Row2InProfile(
              icon: Icons.language,
              text: S.of(context).english,
            ),
          ],
        ),
      ),
    );
  }
}

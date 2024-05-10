import 'package:flutter/material.dart';
import 'package:share/share.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Help%20Page/help_screen.dart';

class ProfileInfo extends StatelessWidget {
  final String title;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;

  final String text1;
  final String text2;
  final String text3;

  const ProfileInfo({
    super.key,
    required this.title,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 180,
      width: double.infinity,
      color: AppColors.profilebackgroundcolor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.semiBoldText(context, 16, AppColors.mainColor),
            ),
            const SizedBox(
              height: 16,
            ),
            RowInProfile(icon: icon1, text: text1),
            const SizedBox(
              height: 16,
            ),
            RowInProfile(icon: icon2, text: text2),
            const SizedBox(
              height: 16,
            ),
            RowInProfile(icon: icon3, text: text3),
          ],
        ),
      ),
    );
  }
}

class ProfileInfoButton extends StatelessWidget {
  final String title;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final IconData? icon4;

  final String text1;
  final String text2;
  final String text3;
  final String? text4;

  const ProfileInfoButton(
      {super.key,
      required this.title,
      required this.icon1,
      required this.icon2,
      required this.icon3,
      required this.text1,
      required this.text2,
      required this.text3,
      this.icon4,
      this.text4});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 180,
      width: double.infinity,
      color: AppColors.profilebackgroundcolor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.semiBoldText(context, 16, AppColors.mainColor),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HelpScreen(),
                    ),
                  );
                },
                child: RowInProfile(icon: icon1, text: text1)),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(child: RowInProfile(icon: icon2, text: text2)),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
                onTap: () {
                  String sharedText =
                      r' "Make your mark, cast your vote." Share via iDemocracy application';
                  Share.share(sharedText);
                },
                child: RowInProfile(icon: icon3, text: text3)),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(child: RowInProfile(icon: icon4, text: text4)),
          ],
        ),
      ),
    );
  }
}

class RowInProfile extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const RowInProfile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Icon(
            icon!,
            size: 20,
            color: AppColors.secondaryTextColor,
          ),
        const SizedBox(
          width: 10,
        ),
        if (text != null)
          Text(
            text!,
            style: AppFonts.regularText(context, 14, Colors.black),
          ),
      ],
    );
  }
}

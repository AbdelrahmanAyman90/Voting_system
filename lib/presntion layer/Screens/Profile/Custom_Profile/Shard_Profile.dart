import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class profile_Info extends StatelessWidget {
  final String title;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final String text1;
  final String text2;
  final String text3;

  const profile_Info(
      {super.key,
      required this.title,
      required this.icon1,
      required this.icon2,
      required this.icon3,
      required this.text1,
      required this.text2,
      required this.text3});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      color: AppColors.eventButtonColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFonts.semiBoldText(
                  fontSize: 16, color: AppColors.mainColor),
            ),
            const SizedBox(
              height: 16,
            ),
            row_in_profile(icon: icon1, text: text1),
            const SizedBox(
              height: 16,
            ),
            row_in_profile(icon: icon2, text: text2),
            const SizedBox(
              height: 16,
            ),
            row_in_profile(icon: icon3, text: text3),
          ],
        ),
      ),
    );
  }
}

class row_in_profile extends StatelessWidget {
  final IconData icon;
  final String text;
  const row_in_profile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.secondaryTextColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppFonts.regularText(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

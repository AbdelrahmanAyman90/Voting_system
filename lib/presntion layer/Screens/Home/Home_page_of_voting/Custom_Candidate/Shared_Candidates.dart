import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class personal_Info extends StatelessWidget {
  final String title;
  final String desc;
  final double width;
  const personal_Info(
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
              fontSize: 12, color: AppColors.navigationBarColor),
        ),
        SizedBox(
          width: width,
        ),
        Text(
          desc,
          style: AppFonts.regularText(
              fontSize: 12, color: AppColors.secondaryTextColor),
        )
      ],
    );
  }
}

class Bio_Goals extends StatelessWidget {
  final String title;
  final String desc;
  const Bio_Goals({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 335 / 375,
      height: MediaQuery.of(context).size.height * 248 / 812,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  AppFonts.boldText(fontSize: 12, color: AppColors.mainColor),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              desc,
              style: AppFonts.regularText(
                  fontSize: 14, color: AppColors.secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}

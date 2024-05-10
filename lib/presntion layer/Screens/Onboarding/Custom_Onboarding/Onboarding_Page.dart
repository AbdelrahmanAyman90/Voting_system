import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class onboarding_page extends StatelessWidget {
  final String img;
  final String? img2;
  final String tittle;
  final String desc;
  final String? tittle2;
  const onboarding_page(
      {super.key,
      required this.img,
      required this.tittle,
      required this.desc,
      this.tittle2,
      this.img2});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(tittle, style: AppFonts.semiBoldText(fontSize: 24)),
          if (tittle2 != null)
            Text(tittle2!, style: AppFonts.semiBoldText(fontSize: 24)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.016,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: AppFonts.regularText(
                  fontSize: 16,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.087,
          ),
          Image(
            image: AssetImage(img),
          ),
          if (img2 != null) ...[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Image(
              image: AssetImage(img2!),
            ),
          ]
        ]);
  }
}

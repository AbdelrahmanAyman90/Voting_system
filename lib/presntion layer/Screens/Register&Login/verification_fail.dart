import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';

import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/register_screen.dart';

class VerificationFail extends StatelessWidget {
  const VerificationFail({super.key, required this.errorMassage});
  final String errorMassage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 90),
        child: Column(
          children: [
            const Image(
                image: AssetImage('assets/images/clarity_sad-face-line.png')),
            const SizedBox(
              height: 40,
            ),
            Text(
              S.of(context).verfication_fail,
              style: AppFonts.boldText(context, 28, Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              errorMassage,
              style: AppFonts.regularText(
                  context, 16, AppColors.secondaryTextColor),
            ),
            const Spacer(),
            Button(
              text: S.of(context).try_agin,
              color: AppColors.mainColor,
              fontsize: 16,
              width: 310,
              height: 45,
              onPressed: () {
                Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => RegisterScreen()),
                // );
              },
              textcolor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

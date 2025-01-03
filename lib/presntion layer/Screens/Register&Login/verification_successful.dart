import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';

import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/home_screen.dart';

class VerificationSuccessful extends StatelessWidget {
  const VerificationSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/Group 692.png')),
            const SizedBox(
              height: 40,
            ),
            Text(
              S.of(context).varfication_succses,
              style: AppFonts.boldText(context, 28, Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              S.of(context).welcome_in_id,
              style: AppFonts.regularText(
                  context, 16, AppColors.secondaryTextColor),
            ),
            const Spacer(),
            Button(
              text: S.of(context).go_home,
              color: AppColors.mainColor,
              fontsize: 16,
              width: 310,
              height: 45,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              textcolor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

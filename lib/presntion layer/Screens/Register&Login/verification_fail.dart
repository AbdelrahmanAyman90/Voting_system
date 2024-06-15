import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/take_real_time_photo.dart';

class VerificationFail extends StatelessWidget {
  const VerificationFail({super.key});

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
              'Verification Fail',
              style: AppFonts.boldText(context, 28, Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Sorry we can’t recognize your identification",
              style: AppFonts.regularText(
                  context, 16, AppColors.secondaryTextColor),
            ),
            const Spacer(),
            Button(
              text: 'Try Again',
              color: AppColors.mainColor,
              fontsize: 16,
              width: 310,
              height: 45,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TakePhoto()),
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

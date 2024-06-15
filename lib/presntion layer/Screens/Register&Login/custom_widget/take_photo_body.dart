import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/verification_successful.dart';

class TakePhotoBody extends StatefulWidget {
  const TakePhotoBody({super.key});

  @override
  State<TakePhotoBody> createState() => _TakePhotoBodyState();
}

class _TakePhotoBodyState extends State<TakePhotoBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        children: [
          Text(
            'Resigter',
            style: AppFonts.boldText(context, 28, AppColors.mainColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Create your new account",
            style:
                AppFonts.regularText(context, 16, AppColors.secondaryTextColor),
          ),
          const SizedBox(
            height: 40,
          ),
          const Image(image: AssetImage('assets/images/Rectangle 167.png')),
          const SizedBox(
            height: 50,
          ),
          Button(
            text: 'Register',
            color: AppColors.mainColor,
            fontsize: 18,
            width: 310,
            height: 45,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VerificationSuccessful()),
              );
            },
            textcolor: Colors.white,
          )
        ],
      ),
    );
  }
}

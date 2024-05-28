import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/upload_form.dart';
import 'package:voting/presntion%20layer/Screens/Home/home_screen.dart';

class NotificationFormBody extends StatelessWidget {
  const NotificationFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 340 / 375,
          child: AlertDialog(
            content: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const Image(
                        image: AssetImage(
                      "assets/images/Mask group candidate.png",
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).candidate_name,
                  style:
                      AppFonts.semiBoldText(context, 16, AppColors.mainColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  S.of(context).notification_content,
                  textAlign: TextAlign.center,
                  style: AppFonts.regularText(
                      context, 16, AppColors.secondaryTextColor),
                ),
              ],
            ),
          ),
        ),
        Button(
            text: S.of(context).Apply,
            color: Colors.white,
            fontsize: 16,
            width: MediaQuery.sizeOf(context).width * 270 / 375,
            height: 44,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const UploadFormScreen(),
                ),
              );
            },
            textcolor: AppColors.mainColor)
      ],
    );
  }
}

class SubmittedSuccessfully extends StatelessWidget {
  const SubmittedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          content: Column(
            children: [
              Text(
                S.of(context).submit_successfully,
                style: AppFonts.regularText(
                  context,
                  16,
                  AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                  text: S.of(context).Ok,
                  color: AppColors.mainColor,
                  fontsize: 16,
                  width: 66,
                  height: 25,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomeScreen(),
                      ),
                    );
                  },
                  textcolor: Colors.white)
            ],
          ),
        ),
      ],
    );
  }
}

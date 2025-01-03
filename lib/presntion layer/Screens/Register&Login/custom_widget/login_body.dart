import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).welcome_back,
            style: AppFonts.boldText(context, 28, AppColors.mainColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            S.of(context).enter_your_account,
            style:
                AppFonts.regularText(context, 16, AppColors.secondaryTextColor),
          ),
          const SizedBox(
            height: 40,
          ),
          const Image(
            image: AssetImage(
              'assets/images/login_logo.PNG',
            ),
            width: 300,
            height: 200,
          ),
          const SizedBox(
            height: 40,
          ),
          LoginForm(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  S.of(context).creat_new_account,
                  style: AppFonts.regularText(context, 16, AppColors.mainColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

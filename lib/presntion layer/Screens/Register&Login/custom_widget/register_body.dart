import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/register_form.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/login_screen.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        children: [
          Text(
            S.of(context).register_word,
            style: AppFonts.boldText(context, 28, AppColors.mainColor),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            S.of(context).crate_account_register,
            style:
                AppFonts.regularText(context, 16, AppColors.secondaryTextColor),
          ),
          const SizedBox(
            height: 60,
          ),
          const RegisterForm(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const LoginScreen()));
                },
                child: Text(
                  S.of(context).Already_having_an_account,
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

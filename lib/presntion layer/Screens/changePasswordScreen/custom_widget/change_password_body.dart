import 'package:flutter/material.dart';

import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/changePasswordScreen/custom_widget/change_password_form.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        children: [
          Text(
            S.of(context).chang_password,
            style: AppFonts.boldText(context, 20, AppColors.mainColor),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.mainColor),
            ),
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                    'assets/images/Group 927.png',
                  ),
                  width: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  S.of(context).hint_change,
                  style: AppFonts.semiBoldText(
                      context, 14, AppColors.secondaryTextColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const ChangePasswordForm(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Change%20Password/custom_widget/change_password_form.dart';

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
            'Change Password',
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
                  'If You Forgot your old password please go to your governorate’s admin.',
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

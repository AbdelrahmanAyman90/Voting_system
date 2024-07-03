import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.white,
                content: Text(
                  S.of(context).forget_password,
                  style: AppFonts.regularText(
                      context, 14, const Color.fromARGB(255, 255, 99, 88)),
                ),
              ));
            },
            child: Text(
              S.of(context).forget,
              style: AppFonts.regularText(context, 14, AppColors.mainColor),
            )),
      ],
    );
  }
}

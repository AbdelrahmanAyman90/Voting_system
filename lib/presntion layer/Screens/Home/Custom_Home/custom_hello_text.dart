import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/Notification_Form_Body.dart';

class CustomHelloText extends StatelessWidget {
  const CustomHelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.of(context).hello_Name,
            style: AppFonts.semiBoldText(
              context,
              24,
              AppColors.mainColor,
            )),
        const Spacer(),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: NotificationFormBody()),
                );
              },
            );
          },
          icon: Icon(Icons.notifications_outlined,
              size: 24, color: AppColors.secondaryTextColor),
        ),
      ],
    );
  }
}
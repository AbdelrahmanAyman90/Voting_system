import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/Notification_Form_Body.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class CustomHelloText extends StatelessWidget {
  const CustomHelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${S.of(context).hello} ${userName} !",
            style: AppFonts.semiBoldText(
              context,
              24,
              AppColors.mainColor,
            )),
      ],
    );
  }
}

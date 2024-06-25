import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/data/models/user_model/user_model.dart';
import 'package:voting/generated/l10n.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: AppColors.mainColor,
            radius: 25,
            child: Center(
              child: Text(
                  //todo api
                  name.isNotEmpty ? name[0].toUpperCase() : "",
                  style: AppFonts.boldText(context, 24, Colors.white)),
            )),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppFonts.semiBoldText(context, 16, Colors.black),
            ),
            isEnglish()
                ? const SizedBox(
                    height: 5,
                  )
                : const SizedBox(
                    height: 0,
                  ),
            Text(
              S.of(context).verified,
              style: AppFonts.regularText(context, 12, AppColors.mainColor),
            )
          ],
        ),
      ],
    );
  }
}

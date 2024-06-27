import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/not_start_screen/not_start_screen.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/resultwidget/result_body.dart';

class ResultMobileLayoutBody extends StatelessWidget {
  const ResultMobileLayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 60,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(S.of(context).result,
              style: AppFonts.boldText(context, 24, AppColors.mainColor)),
        ),
      ),
      body: eventCases("elections") == "not start"
          ? const NotStart()
          : RusltBody(),
    );
  }
}

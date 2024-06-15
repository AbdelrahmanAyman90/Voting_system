import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/generated/l10n.dart';
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
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(S.of(context).result,
              style: AppFonts.boldText(context, 28, AppColors.mainColor)),
        ),
      ),
      body: const RusltBody(),
    );
  }
}

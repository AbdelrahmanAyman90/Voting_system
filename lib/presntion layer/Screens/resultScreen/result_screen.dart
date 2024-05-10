import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/resultwidget/result_body.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            S.of(context).result,
            style: TextStyle(
              fontSize: 28,
              color: AppColors.mainColor,
              //Color(0xFF008753),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: RusltBody(),
    );
  }
}

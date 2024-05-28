import 'package:flutter/material.dart';

import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';

import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/Upload_Form_Body.dart';

class UploadFormScreen extends StatefulWidget {
  const UploadFormScreen({super.key});

  @override
  State<UploadFormScreen> createState() => _UploadFormScreenState();
}

class _UploadFormScreenState extends State<UploadFormScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              S.of(context).Form,
              style: AppFonts.boldText(context, 24, AppColors.mainColor),
            ),
          ),
          body: const UploadFormBody()),
    );
  }
}

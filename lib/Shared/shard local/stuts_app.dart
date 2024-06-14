import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';

class MyAppStuts {
  static void showSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }

  static Widget myLooding() {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(.6),
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}

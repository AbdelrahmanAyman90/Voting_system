import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const CustomTextFormField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).error_should_enter_id;
        }
        if (value.length < 14) {
          return S.of(context).error_lenght_id;
        }
        return null;
      },
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: hintText,
          hintStyle:
              AppFonts.regularText(context, 16, AppColors.secondaryTextColor),
          border: borderTextField(),
          enabledBorder: borderTextField(),
          focusedBorder: borderTextField(),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red))),
    );
  }

  OutlineInputBorder borderTextField() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.borderColor),
    );
  }
}

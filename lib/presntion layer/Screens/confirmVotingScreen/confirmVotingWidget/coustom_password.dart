import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class CustomPassowrdText extends StatefulWidget {
  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  const CustomPassowrdText(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.controller});

  @override
  State<CustomPassowrdText> createState() => _CustomPassowrdTextState();
}

class _CustomPassowrdTextState extends State<CustomPassowrdText> {
  bool _obscureText = true;
  //TextEditingController ConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        hintText: widget.hintText,
        hintStyle:
            AppFonts.regularText(context, 16, AppColors.secondaryTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColors.mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xFF008753),
          ), // Color when focused
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Color when error
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[500],
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}

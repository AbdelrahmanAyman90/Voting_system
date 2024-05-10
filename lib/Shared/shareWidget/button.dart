import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.word,
      required this.color,
      required this.onPressed,
      required this.textcolor});
  final String word;
  final Color color;
  final Color textcolor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: const Size(265, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: textcolor),
        ),
      ),
      child:
          Text('${word}', style: AppFonts.regularText(context, 18, textcolor)),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final Color textcolor;
  final double fontsize;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  const Button(
      {super.key,
      required this.text,
      required this.color,
      required this.fontsize,
      this.width,
      this.height,
      required this.onPressed,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: AppColors.borderColor),
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(width!, height!),
          ),
        ),
        child: Text(
          text,
          style: AppFonts.regularText(context, fontsize, textcolor),
        ));
  }
}

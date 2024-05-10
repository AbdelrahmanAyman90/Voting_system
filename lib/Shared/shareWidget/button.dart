import 'package:flutter/material.dart';

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
      child: Text(
        '${word}',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: textcolor,
        ),
      ),
    );
  }
}

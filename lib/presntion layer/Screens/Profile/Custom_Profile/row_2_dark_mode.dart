import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class row2_in_profile_dark_mode extends StatefulWidget {
  final IconData icon;
  final String text;
  const row2_in_profile_dark_mode({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  State<row2_in_profile_dark_mode> createState() => _row2_in_profileState();
}

class _row2_in_profileState extends State<row2_in_profile_dark_mode> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          size: 20,
          color: AppColors.secondaryTextColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.text,
          style: AppFonts.regularText(context, 14, Colors.black),
        ),
        const Spacer(),
        Switch(
          value: _isSwitched,
          onChanged: (value) {
            setState(() {
              _isSwitched = value;
            });
          },
          activeTrackColor: AppColors.mainColor,
          activeColor: Colors.white,
        ),
      ],
    );
  }
}

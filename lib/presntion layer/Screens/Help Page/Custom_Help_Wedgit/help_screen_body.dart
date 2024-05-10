import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Help%20Page/Custom_Help_Wedgit/help_screen_content.dart';

class HelpScreenBody extends StatelessWidget {
  const HelpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const HelpScreenContent(),
    );
  }
}

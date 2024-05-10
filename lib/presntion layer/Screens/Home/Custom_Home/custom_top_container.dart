import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_news.dart';

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CustomNews(),
      ),
    );
  }
}

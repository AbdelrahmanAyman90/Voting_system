import 'package:flutter/material.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_hello_text.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_news_list.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_trending_news_text.dart';

class CustomNews extends StatelessWidget {
  const CustomNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHelloText(),
        SizedBox(
          height: isEnglish() ? 12 : 10,
        ),
        const CustomTrendingNewsText(),
        const SizedBox(
          height: 10,
        ),
        const Expanded(child: CustomNewsList()),
      ],
    );
  }
}

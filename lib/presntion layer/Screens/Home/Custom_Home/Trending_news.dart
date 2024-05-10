import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_trending_news_page.dart';

class TrendingNews extends StatefulWidget {
  const TrendingNews({super.key});

  @override
  State<TrendingNews> createState() => _TrendingNewsState();
}

class _TrendingNewsState extends State<TrendingNews> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.mainColor,
                size: 20,
              )),
        ),
        body: const CustomTrendingNews(),
      ),
    );
  }
}

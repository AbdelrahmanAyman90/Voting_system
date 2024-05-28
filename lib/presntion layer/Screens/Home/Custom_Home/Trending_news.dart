import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_trending_news_page.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews(
      {required this.dataNews,
      required this.tittelNews,
      required this.image,
      required this.content});
  final String tittelNews, dataNews, content, image;
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
            ),
          ),
        ),
        body: CustomTrendingNews(
          image: image,
          date_news: dataNews,
          tittel_news: tittelNews,
          content: content,
        ),
      ),
    );
  }
}

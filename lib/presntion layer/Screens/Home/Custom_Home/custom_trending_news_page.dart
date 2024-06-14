import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/trending_news_page_content.dart';

class CustomTrendingNews extends StatelessWidget {
  const CustomTrendingNews(
      {required this.date_news,
      required this.tittel_news,
      required this.image,
      required this.content});
  final String tittel_news;
  final String date_news;
  final String content;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // S.of(context).tittel_news,
            tittel_news,
            style: AppFonts.semiBoldText(context, 16, Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            //S.of(context).data_news,

            DateTime.parse(date_news).toLocal().toString().split(' ')[0],
            style:
                AppFonts.regularText(context, 16, AppColors.secondaryTextColor),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: ContentOfTrendingNewsPage(
            newsContent: content,
            image: image,
          )))
        ],
      ),
    );
  }
}

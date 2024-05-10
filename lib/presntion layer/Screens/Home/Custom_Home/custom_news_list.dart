import 'package:flutter/material.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/Trending_news.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/news_container.dart';

class CustomNewsList extends StatelessWidget {
  const CustomNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i <= 4; i++)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const TrendingNews(),
                  ),
                );
              },
              child: NewsContainer(
                  img: 'assets/images/Rectangle 204.png',
                  title: S.of(context).tittel_news),
            ),
        ],
      ),
    );
  }
}

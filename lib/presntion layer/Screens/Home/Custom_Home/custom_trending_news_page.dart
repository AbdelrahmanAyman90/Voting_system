import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/trending_news_page_content.dart';

class CustomTrendingNews extends StatelessWidget {
  const CustomTrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       color: AppColors.mainColor,
          //       size: 20,
          //     )),
          Text(
            S.of(context).tittel_news,
            style: AppFonts.semiBoldText(context, 16, Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            S.of(context).data_news,
            style:
                AppFonts.regularText(context, 16, AppColors.secondaryTextColor),
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
              child: SingleChildScrollView(child: ContentOfTrendingNewsPage()))
        ],
      ),
    );
  }
}

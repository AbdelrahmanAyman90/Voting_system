import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class ContentOfTrendingNewsPage extends StatelessWidget {
  const ContentOfTrendingNewsPage(
      {required this.newsContent, required this.image});
  final String newsContent, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 335 / 187,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            )),
        const SizedBox(
          height: 18,
        ),
        Text(
          // S.of(context).news_content,
          newsContent,
          style: AppFonts.semiBoldText(
            context, 14, AppColors.secondaryTextColor, //height: 1.5
          ),
        )
      ],
    );
  }
}

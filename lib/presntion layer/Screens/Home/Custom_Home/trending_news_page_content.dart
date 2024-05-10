import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class ContentOfTrendingNewsPage extends StatelessWidget {
  const ContentOfTrendingNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 335 / 187,
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/Rectangle 179.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            )),
        const SizedBox(
          height: 18,
        ),
        Text(
          S.of(context).news_content,
          style: AppFonts.semiBoldText(
            context, 14, AppColors.secondaryTextColor, //height: 1.5
          ),
        )
      ],
    );
  }
}

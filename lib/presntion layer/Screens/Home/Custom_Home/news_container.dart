import 'package:flutter/material.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';

class NewsContainer extends StatefulWidget {
  final String img;
  final String title;
  const NewsContainer({super.key, required this.img, required this.title});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: isEnglish() ? 10 : 0,
        left: isEnglish() ? 0 : 10,
      ),
      // height: MediaQuery.of(context).size.height * 154 / 812,
      // width: MediaQuery.of(context).size.width * 273 / 375,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(widget.img), fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            SizedBox(
              width: 250,
              //height: MediaQuery.of(context).size.width * 80 / 812,
              child: Text(
                widget.title,
                style: AppFonts.semiBoldText(
                  context,
                  12,
                  Colors.white,
                ),
              ),
            ),
            const Flexible(
              child: SizedBox(
                height: 35 - 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_page_of_nomination/Trending_news.dart';
import 'package:voting/Shared/Fonts.dart';

class news_button extends StatefulWidget {
  const news_button({super.key});

  @override
  State<news_button> createState() => _news_buttonState();
}

class _news_buttonState extends State<news_button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const Trending_news(),
          ),
        );
      },
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          height: 130,
          width: MediaQuery.of(context).size.width * 273 / 375,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle 204.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 250 / 375,
                  height: MediaQuery.of(context).size.width * 70 / 812,
                  child: Text(
                    'Billionaire-backed Koch network endorses Nikki for president.',
                    style: AppFonts.semiBoldText(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class Trending_news extends StatefulWidget {
  const Trending_news({super.key});

  @override
  State<Trending_news> createState() => _Trending_newsState();
}

class _Trending_newsState extends State<Trending_news> {
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
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 20 / 375,
              vertical: MediaQuery.of(context).size.height * 20 / 812),
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
                style: AppFonts.semiBoldText(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                S.of(context).data_news,
                style: AppFonts.regularText(
                    fontSize: 16, color: AppColors.secondaryTextColor),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Image(
                        image: AssetImage('assets/images/Rectangle 179.png')),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae. dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae. dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae. dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.dolor sit amet consectetur adipisicing elit. Dolore possimus dicta, ad recusandae sint consectetur perferendis dolorem! Iure maxime ullam quis, molestiae corporis provident error eius! Excepturi explicabo nostrum recusandae.',
                      style: AppFonts.semiBoldText(
                          fontSize: 14,
                          color: AppColors.secondaryTextColor,
                          height: 1.5),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

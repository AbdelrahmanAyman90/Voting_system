import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Fonts.dart';
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
    return IntrinsicWidth(
      child: SizedBox(
        child: Stack(children: [
          Container(
              margin: EdgeInsets.only(
                right: isEnglish() ? 10 : 0,
                left: isEnglish() ? 0 : 10,
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.img), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Container(
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 35, 35, 35).withOpacity(0.5),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)) // Adjust opacity as needed
                    ),
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 250,
                    child: Text(widget.title,
                        style: AppFonts.semiBoldText(
                          context,
                          14,
                          const Color.fromARGB(255, 255, 255, 255),
                        )),
                  ),
                  const Flexible(
                    child: SizedBox(
                      height: 35 - 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

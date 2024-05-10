import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Image(
          //   image: AssetImage(
          //     'assets/images/App Logo.png',
          //   ),
          //   height: 100,
          //   width: 100,
          // ),
          // const SizedBox(
          //   height: 50,
          // ),
          Row(
            children: [
              Icon(
                Icons.how_to_vote_rounded,
                size: 30,
                color: AppColors.mainColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'iDemocracy',
                style: AppFonts.semiBoldText(context, 16, Colors.black),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          Divider(
            color: AppColors.mainColor.withOpacity(0.5),
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

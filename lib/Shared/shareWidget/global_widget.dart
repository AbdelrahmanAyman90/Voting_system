import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';

Widget imageContainer(String image) {
  return Container(
    width: 120,
    height: 70,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: CachedNetworkImageProvider(image),
        fit: BoxFit.fill,
      ),
    ),
  );
}

PreferredSizeWidget? buildAppBar(BuildContext context, String name) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: 60,
    title: Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("$name",
          style: AppFonts.boldText(context, 28, AppColors.mainColor)),
    ),
  );
}

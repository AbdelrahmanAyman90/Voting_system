import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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

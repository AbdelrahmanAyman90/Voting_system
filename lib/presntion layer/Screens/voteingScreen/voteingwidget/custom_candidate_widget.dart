import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shareWidget/global_widget.dart';

class ShowCandidate extends StatelessWidget {
  final bool isSelected; // Property to indicate selection status
  final String name;
  final String image;
  final String bio;
  const ShowCandidate(
      {Key? key,
      required this.isSelected,
      required this.name,
      required this.image,
      required this.bio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 110,
      // width: 360,
      decoration: BoxDecoration(
        color: AppColors.whitebackgroundcolor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? const Color.fromRGBO(0, 135, 83, 1)
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: Row(
          children: [
            imageContainer(imagePath + image),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //todo api
                    name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: isEnglish() ? 8 : 0),
                  Text(
                    bio,
                    style: TextStyle(
                        color: AppColors.secondaryTextColor, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

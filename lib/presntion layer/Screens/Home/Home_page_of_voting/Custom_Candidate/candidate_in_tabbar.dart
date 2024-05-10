import 'package:flutter/material.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_page_of_voting/Candidates.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class candidate_list extends StatefulWidget {
  const candidate_list({super.key});

  @override
  State<candidate_list> createState() => _candidate_listState();
}

class _candidate_listState extends State<candidate_list> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Candidates(),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: const Image(
                image: AssetImage(
              'assets/images/unsplash_pAtA8xe_iVM.png',
            )),
          ),
          Expanded(
            child: Padding(
              padding: isEnglish()
                  ? EdgeInsets.only(left: 10)
                  : EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).candidate_name,
                    style: AppFonts.regularText(fontSize: 16),
                  ),
                  Text(
                    S.of(context).candidate_bio,
                    maxLines: 2,
                    style: AppFonts.regularText(
                        height: 1.5,
                        fontSize: 12,
                        color: AppColors.secondaryTextColor),
                  ),
                  SizedBox(
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => Candidates(),
                              ),
                            );
                          },
                          child: Text(
                            S.of(context).read_more,
                            style: AppFonts.boldText(
                                fontSize: 12,
                                color: AppColors.secondaryTextColor),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

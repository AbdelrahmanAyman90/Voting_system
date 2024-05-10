import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/application_form.dart';

class EventContainer extends StatefulWidget {
  final String img;
  final String title;
  final String time;
  const EventContainer({
    super.key,
    required this.img,
    required this.title,
    required this.time,
  });

  @override
  State<EventContainer> createState() => _EventContainerState();
}

class _EventContainerState extends State<EventContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // SvgPicture.asset(widget.img,
            //     width: MediaQuery.of(context).size.width * 50 / 375,
            //     height: MediaQuery.of(context).size.height * 50 / 812),
            // const SizedBox(
            //   width: 10,
            // ),
            Image(
                image: AssetImage(widget.img),
                width: MediaQuery.of(context).size.width * 40 / 375,
                height: MediaQuery.of(context).size.height * 40 / 812),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppFonts.semiBoldText(context, 12, Colors.black),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  S.of(context).Nationwide,
                  style: AppFonts.regularText(
                      context, 12, AppColors.secondaryTextColor),
                )
              ],
            )
          ],
        ),
        //const Spacer(),
        const SizedBox(
          height: 20,
        ),
//////////  Second Row inside Event container
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: AppColors.secondaryTextColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.time,
                      style: AppFonts.regularText(
                          context, 12, AppColors.secondaryTextColor),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.assignment_turned_in_outlined,
                      color: AppColors.secondaryTextColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      S.of(context).all_voter_number,
                      style: AppFonts.regularText(
                          context, 12, AppColors.secondaryTextColor),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Button(
                text: S.of(context).Apply,
                color: Colors.white,
                fontsize: 12,
                width: 102,
                height: 32,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const ApplicationFormScreen(),
                    ),
                  );
                },
                textcolor: AppColors.mainColor)
          ],
        ),
      ],
    );
  }
}

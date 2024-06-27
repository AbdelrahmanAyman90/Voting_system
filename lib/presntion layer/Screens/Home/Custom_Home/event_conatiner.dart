import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/application_form.dart';

class EventContainer extends StatefulWidget {
  final String img;
  final String title;
  final String time;
  final String cases;
  final void Function() onPressed;
  const EventContainer(
      {super.key,
      required this.onPressed,
      required this.img,
      required this.title,
      required this.time,
      required this.cases});

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
          height: 5,
        ),
//////////  Second Row inside Event container
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: AppColors.secondaryTextColor,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  widget.cases == "end"
                      ? Center(
                          child: Text(
                            "انتهت الفتره",
                            style:
                                AppFonts.regularText(context, 18, Colors.red),
                          ),
                        )
                      : widget.cases == "not start"
                          ? Text(
                              "لم تبدا بعد",
                              style: AppFonts.regularText(
                                  context, 18, Colors.amber),
                            )
                          : Text(
                              "ستنتهي بعد ${widget.time}",
                              style: AppFonts.regularText(
                                  context, 18, AppColors.secondaryTextColor),
                            )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              const Spacer(),
              widget.cases == "end"
                  ? SizedBox(
                      height: 36,
                    )
                  : Button(
                      text: S.of(context).Apply,
                      color: widget.cases == "not start"
                          ? Colors.white
                          : AppColors.mainColor,
                      fontsize: 16,
                      width: 102,
                      height: 32,
                      onPressed: widget.cases == "not start"
                          ? () {
                              null;
                            }
                          : widget.onPressed,
                      textcolor: widget.cases == "not start"
                          ? AppColors.mainColor
                          : Colors.white,
                    )
            ],
          ),
        ),
      ],
    );
  }
}

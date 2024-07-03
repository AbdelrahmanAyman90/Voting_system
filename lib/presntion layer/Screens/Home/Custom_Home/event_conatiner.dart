import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class EventContainer extends StatefulWidget {
  final String img;
  final String title;
  final DateTime endTime;
  final String cases;
  final void Function() onPressed;
  final String textButton;
  const EventContainer(
      {super.key,
      required this.onPressed,
      required this.img,
      required this.title,
      required this.endTime,
      required this.cases,
      required this.textButton});

  @override
  State<EventContainer> createState() => _EventContainerState();
}

class _EventContainerState extends State<EventContainer> {
  late Duration remainingTime;
  late String formattedTime = "";

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

// didChangeDependencies is called just a few moments after the state loads its dependencies and context is available at this moment so here you can use context.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateRemainingTime();
  }

  void _updateRemainingTime() {
    log("===============");
    log(isEnglish().toString());

    // Get current time in Egypt
    tz.Location egypt = tz.getLocation('Africa/Cairo');
    tz.TZDateTime nowEgypt = tz.TZDateTime.now(egypt);

    // Convert widget.endTime to Egypt time zone
    tz.TZDateTime endTimeEgypt = tz.TZDateTime.from(widget.endTime, egypt);

    // Calculate the remaining time
    Duration remainingTime = endTimeEgypt.difference(nowEgypt);

    setState(() {
      if (remainingTime.isNegative) {
        formattedTime = "انتهت الفتره";
      } else if (remainingTime.inDays > 0) {
        formattedTime = isEnglish()
            ? ' ${remainingTime.inDays.toString()} Day '
            : ' ${convertEnglishNumberToArabicNumber(remainingTime.inDays.toString())} يوم';
      } else if (remainingTime.inHours > 0) {
        formattedTime = isEnglish()
            ? ' ${remainingTime.inDays.toString()} Hours'
            : ' ${convertEnglishNumberToArabicNumber(remainingTime.inHours.toString())} ساعه';
      } else {
        formattedTime = isEnglish()
            ? ' ${remainingTime.inDays.toString()} Minutes'
            : ' ${convertEnglishNumberToArabicNumber(remainingTime.inMinutes.toString())} دقيقه';
      }
    });
    endtimeElection = formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    log("1111111111111111111111");
    log(formattedTime);
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: AssetImage(widget.img),
              width: MediaQuery.of(context).size.width * 40 / 375,
              height: MediaQuery.of(context).size.height * 40 / 812,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: AppFonts.semiBoldText(context, 16, Colors.black),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(right: isEnglish() ? 3 : 0),
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
                            S.of(context).end_period,
                            style:
                                AppFonts.regularText(context, 16, Colors.red),
                          ),
                        )
                      : widget.cases == "not start"
                          ? Text(
                              S.of(context).not_start_period,
                              style: AppFonts.regularText(
                                  context, 16, Colors.amber),
                            )
                          : Text(
                              "${S.of(context).wnded_after}$formattedTime",
                              style: AppFonts.regularText(
                                  context, 16, AppColors.secondaryTextColor),
                            )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              const Spacer(),
              widget.cases == "end"
                  ? const SizedBox(height: 36)
                  : Button(
                      text: widget.textButton,
                      color: widget.cases == "not start"
                          ? Colors.white
                          : AppColors.mainColor,
                      fontsize: 16,
                      width: 102,
                      height: 32,
                      onPressed: widget.cases == "not start"
                          ? () => null
                          : widget.onPressed,
                      textcolor: widget.cases == "not start"
                          ? AppColors.mainColor
                          : Colors.white,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

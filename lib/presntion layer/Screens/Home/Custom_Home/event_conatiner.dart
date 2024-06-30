import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:voting/presntion%20layer/view_model/prepare_app_viewmodel/cubit/prepare_cubit.dart';

class EventContainer extends StatefulWidget {
  final String img;
  final String title;
  final DateTime endTime;
  final String cases;
  final void Function() onPressed;

  const EventContainer({
    super.key,
    required this.onPressed,
    required this.img,
    required this.title,
    required this.endTime,
    required this.cases,
  });

  @override
  State<EventContainer> createState() => _EventContainerState();
}

class _EventContainerState extends State<EventContainer> {
  late Duration remainingTime;
  late String formattedTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _updateRemainingTime();
  }

  void _updateRemainingTime() {
    // Get current time in Egypt
    tz.initializeTimeZones();

    tz.Location egypt = tz.getLocation('Africa/Cairo');
    tz.TZDateTime nowEgypt = tz.TZDateTime.now(egypt);

    // Convert widget.endTime to Egypt time zone
    tz.TZDateTime endTimeEgypt = tz.TZDateTime.from(widget.endTime, egypt);

    // Calculate the remaining time
    Duration remainingTime = endTimeEgypt.difference(nowEgypt);

    // Calculate the remaining time

    setState(() {
      if (remainingTime.isNegative) {
        formattedTime = "انتهت الفتره";
      } else if (remainingTime.inDays > 0) {
        formattedTime =
            ' ${convertEnglishNumberToArabicNumber(remainingTime.inDays.toString())} يوم';
      } else if (remainingTime.inHours > 0) {
        formattedTime =
            '${convertEnglishNumberToArabicNumber(remainingTime.inHours.toString())} ساعه';
      } else {
        formattedTime =
            '${convertEnglishNumberToArabicNumber(remainingTime.inMinutes.toString())} دقيقه';
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  style: AppFonts.semiBoldText(context, 18, Colors.black),
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
                              "ستنتهي بعد $formattedTime",
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
                  ? const SizedBox(height: 36)
                  : BlocBuilder<PrepareAppCubit, PrepareAppState>(
                      builder: (context, state) {
                        return Button(
                          text: S.of(context).Apply,
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
                        );
                      },
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/event_conatiner.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';

class EventBody extends StatelessWidget {
  const EventBody(
      {super.key,
      required this.caseEventName,
      required this.endDataTime,
      required this.image,
      required this.onPressed,
      required this.tittel});
  final String image;
  final String tittel;
  final String caseEventName;
  final String endDataTime;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: IntrinsicHeight(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: EventContainer(
                img: image,
                title: tittel,
                cases: context.read<EventCubit>().eventCases(caseEventName)!,
                endTime: DateTime.parse(endDataTime),
                onPressed: onPressed),
          ),
        ),
      ),
    );
  }
}

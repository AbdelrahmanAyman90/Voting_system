import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';

import 'package:voting/Shared/shareWidget/stuts_app.dart';
import 'package:voting/data/models/event_model/event_model.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/application_form.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/bottom_navgiation_bar.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/event_body.dart';
import 'package:voting/presntion%20layer/view_model/check_iscandidate_viewmodel/cubit/cheack_is_candidate_cubit.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';

class CustomEventPage extends StatefulWidget {
  const CustomEventPage(
      {super.key, required this.eventDate, required this.controller});
  final List<Events> eventDate;
  final VoidCallback controller;

  @override
  State<CustomEventPage> createState() => _CustomEventPageState();
}

class _CustomEventPageState extends State<CustomEventPage> {
  Future<void> _checkIsCandidateSelf() async {
    if (context.read<CheackIsCandidateCubit>().isCandidateSelf == null &&
        context.read<EventCubit>().eventCases("nomination") == "now") {
      await context.read<CheackIsCandidateCubit>().isUserCandidateSelf();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _checkIsCandidateSelf(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return BlocBuilder<CheackIsCandidateCubit, CheackIsCandidateState>(
              builder: (context, state) {
            if (state is CheackIsCandidateSelfLooding) {
              return buildShammerWidget();
            } else if (state is CheackIsCandidateSelfFail) {
              return Center(
                child: Text(
                  state.errorMassage,
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              //varible
              final isCandidateSelf =
                  context.read<CheackIsCandidateCubit>().isCandidateSelf;
//varible
              final List<SomeEventData> someEventDate = [
                SomeEventData(
                  textButton: S.of(context).applay,
                  title: S.of(context).NOMINATING_FOR_ELECTIONS,
                  onPressed:
                      context.read<EventCubit>().eventCases("nomination") ==
                                  "now" &&
                              isCandidateSelf == true
                          ? () {
                              MyAppStuts.showSnackBar(
                                  context, S.of(context).error_candidate);
                            }
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const ApplicationFormScreen(),
                                ),
                              );
                            },
                ),
                SomeEventData(
                    textButton: S.of(context).show,
                    title: S.of(context).add_Campign_Candidates,
                    onPressed: widget.controller),
                SomeEventData(
                  textButton: S.of(context).vote_vutton,
                  title: S.of(context).choose_Candidate,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            const BottomNavgiationBarWidget(select: 1),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ];

              return RefreshIndicator(
                color: Colors.white,
                backgroundColor: AppColors.mainColor,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return EventBody(
                      textButton: someEventDate[index].textButton,
                      caseEventName: widget.eventDate[index].type!,
                      endDataTime: widget.eventDate[index].end!,
                      image: 'assets/images/Ellipse 36.png',
                      onPressed: someEventDate[index].onPressed,
                      tittel: someEventDate[index].title,
                    );
                  },
                  itemCount: widget.eventDate.length,
                ),
                onRefresh: () {
                  return context.read<EventCubit>().fetchEvent();
                },
              );
            }
          });
        }
      },
    );
  }
}

//!class to data of each event
class SomeEventData {
  final String title;
  final VoidCallback onPressed;
  final String textButton;
  SomeEventData(
      {required this.title, required this.onPressed, required this.textButton});
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/stuts_app.dart';
import 'package:voting/data/models/event_model/event_model.dart';
import 'package:voting/data/repository/preparapp/prepar_app_repo_implment.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/application_form.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/bottom_navgiation_bar.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/event_body.dart';
import 'package:voting/presntion%20layer/view_model/check_iscandidate_viewmodel/cubit/cheack_is_candidate_cubit.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';
import 'package:voting/presntion%20layer/view_model/prepare_app_viewmodel/cubit/news_cubit.dart';

class CustomEventPage extends StatefulWidget {
  const CustomEventPage({super.key, required this.eventDate});
  final List<Events> eventDate;

  @override
  State<CustomEventPage> createState() => _CustomEventPageState();
}

class _CustomEventPageState extends State<CustomEventPage>
    with SingleTickerProviderStateMixin {
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
              final isCandidateSelf =
                  context.read<CheackIsCandidateCubit>().isCandidateSelf;

              final List<SomeEventData> someEventDate = [
                SomeEventData(
                  title: S.of(context).NOMINATING_FOR_ELECTIONS,
                  onPressed:
                      context.read<EventCubit>().eventCases("nomination") ==
                                  "now" &&
                              isCandidateSelf == true
                          ? () {
                              MyAppStuts.showSnackBar(
                                  context, "لقد رشحت نفسك من قبل");
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
                  title: S.of(context).add_Campign_Candidates,
                  onPressed: () {
                    // TODO: your code to navigate
                  },
                ),
                SomeEventData(
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

              return ListView.builder(
                itemBuilder: (context, index) {
                  return EventBody(
                    caseEventName: widget.eventDate[index].type!,
                    endDataTime: widget.eventDate[index].end!,
                    image: 'assets/images/Ellipse 36.png',
                    onPressed: someEventDate[index].onPressed,
                    tittel: someEventDate[index].title,
                  );
                },
                itemCount: widget.eventDate.length,
              );
            }
          });
        }
      },
    );
  }
}

class SomeEventData {
  final String title;
  final VoidCallback onPressed;

  SomeEventData({
    required this.title,
    required this.onPressed,
  });
}

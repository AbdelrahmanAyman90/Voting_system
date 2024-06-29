import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shard%20local/stuts_app.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/application_form.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/bottom_navgiation_bar.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_tab_bar.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/event_conatiner.dart';

class CustomEventPage extends StatefulWidget {
  const CustomEventPage({super.key});

  @override
  State<CustomEventPage> createState() => _CustomEventPageState();
}

class _CustomEventPageState extends State<CustomEventPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //!first event
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: IntrinsicHeight(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: EventContainer(
                    img: 'assets/images/Ellipse 36.png',
                    title: S.of(context).NOMINATING_FOR_ELECTIONS,
                    time: "8",
                    cases: eventCases("nomination")!,
                    onPressed: isCandidateSelf == true
                        ? () {
                            MyAppStuts.showSnackBar(
                                context, "لقد رشحت نفسك من  قبل ");
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
                ),
              ),
            ),
          ),
          //! second event
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: IntrinsicHeight(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: EventContainer(
                    img: 'assets/images/Ellipse 36.png',
                    title: S.of(context).add_Campign_Candidates,
                    time: "7",
                    cases: eventCases("candidates")!,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
          //!third event
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: IntrinsicHeight(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: EventContainer(
                    img: 'assets/images/Ellipse 36.png',
                    title: S.of(context).choose_Candidate,
                    time: "5",
                    cases: eventCases("elections")!,
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavgiationBarWidget(
                                    select: 1,
                                  )),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

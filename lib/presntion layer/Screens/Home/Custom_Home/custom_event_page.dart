import 'package:flutter/material.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/event_conatiner.dart';

class CustomEventPage extends StatelessWidget {
  const CustomEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> eventTittel = [
      S.of(context).NOMINATING_FOR_ELECTIONS,
      S.of(context).add_Campign_Candidates,
      S.of(context).choose_Candidate
    ];
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: IntrinsicHeight(
            child: Container(
              // width: MediaQuery.of(context).size.width * 335 / 375,
              // height: MediaQuery.of(context).size.height * 145 / 812,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: EventContainer(
                    img: 'assets/images/Ellipse 36.png',
                    title: eventTittel[index],
                    time: S.of(context).voting_end),
              ),
            ),
          ),
        );
      },
    );
  }
}

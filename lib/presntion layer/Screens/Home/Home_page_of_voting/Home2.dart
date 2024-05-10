import 'package:flutter/material.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/event_conatiner.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/news_widget.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_page_of_voting/Custom_Candidate/candidate_in_tabbar.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _HomeState();
}

class _HomeState extends State<Home2> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
///////////////////////////////// Container of Trending News ////////////////////////////////////////////////////////
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 20 / 375,
                      vertical: MediaQuery.of(context).size.height * 20 / 812),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('${S.of(context).name_personal}!',
                              style: AppFonts.semiBoldText(
                                  color: AppColors.mainColor, fontSize: 24)),
                          const Spacer(),
                          Icon(
                            Icons.notifications_outlined,
                            size: 24,
                            color: AppColors.secondaryTextColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 25 / 812,
                      ),
                      Row(
                        children: [
                          Text(S.of(context).trending_news,
                              style: AppFonts.regularText(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 18)),
                          Icon(
                            Icons.campaign_outlined,
                            color: AppColors.secondaryTextColor,
                          ),
                          // const Image(
                          //     image: AssetImage('assets/images/Group 720.png')),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 12 / 812,
                      ),
//////////////////////////////////////// Trending News List ///////////////////////////////////////////////////////////
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i <= 4; i++) const news_button(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
//////////////////////////////////////////// Events & Candidates ///////////////////////////////////////////////////
            Expanded(
              flex: 3,
              child: Container(
                color: AppColors.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 20 / 375,
                          vertical:
                              MediaQuery.of(context).size.height * 21 / 812),
///////////////////////////////////////////////  Tabbar   /////////////////////////////////////////////////////////////////////////////
                      child: Container(
                          width: MediaQuery.of(context).size.width * 335 / 375,
                          height: MediaQuery.of(context).size.height * 55 / 812,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TabBar(
                                indicator: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.borderColor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    color: AppColors.tabBarColor),
                                controller: _controller,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      S.of(context).event_word,
                                      style:
                                          TextStyle(color: AppColors.mainColor),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      S.of(context).candidate_word,
                                      style:
                                          TextStyle(color: AppColors.mainColor),
                                    ),
                                  ),
                                ]),
                          )),
                    ),
/////////////////////////////////////////////  List Of Events   //////////////////////////////////////////////////////////////////
                    Expanded(
                        child: TabBarView(
                      controller: _controller,
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
////////////////////////////////////////// Padding for Events Container ///////////////////////////////////////////////
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      20 /
                                      375,
                                  right: MediaQuery.of(context).size.width *
                                      20 /
                                      375,
                                  bottom: MediaQuery.of(context).size.height *
                                      10 /
                                      812),
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    335 /
                                    375,
                                height: MediaQuery.of(context).size.height *
                                    145 /
                                    812,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
/////////////////////////////////////////////  Column padding inside Event container /////////////////////////////////////////////////
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: event_container(),
                                ),
                              ),
                            );
                          },
                        ),
///////////////////////////////////////////////////////// Page of Candidats in Tabbar /////////////////////////////////////////
                        ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      20 /
                                      375,
                                  right: MediaQuery.of(context).size.width *
                                      20 /
                                      375,
                                  bottom: MediaQuery.of(context).size.height *
                                      10 /
                                      812),
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    335 /
                                    375,
                                height: MediaQuery.of(context).size.height *
                                    110 /
                                    812,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: candidate_list(),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

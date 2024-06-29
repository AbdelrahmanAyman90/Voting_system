import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/data/repository/candidate/candidate_repo_implemntion.dart';
import 'package:voting/data/repository/news/news_repo_implment.dart';
import 'package:voting/data/repository/user_authorization/user_repo_implement.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/register_screen.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_info_biewmodel/cubit/get_candidate_info_cubit.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_viewmodel/cubit/get_candidate_cubit.dart';
import 'package:voting/presntion%20layer/view_model/layout_viewmodel/cubit/layout_cubit.dart';
import 'package:voting/presntion%20layer/view_model/news_viewmodel/cubit/news_cubit.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

Future<void> main() async {
  // debugInvertOversizedImages = true; //يعكس الصوره الي حجمها كبير
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding
      .ensureInitialized(); //مش هتنفذ حاجه غسر لما الي تحتك يكمل الاول
  await CashNetwork.cashInitialization(); //اول ما يفتح  التطبيق هيستدعيها علطول
  await prepareDate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LayoutCubit>(
            create: (context) => LayoutCubit()..changeLanguage("initial"),
          ),
          BlocProvider<UserAuthorizationCubit>(
              create: (context) => UserAuthorizationCubit(
                  UserAuthorizationepoImplemntion(
                      apiServes: ApiServes(dio: creatdio())))),
          BlocProvider<PrepareAppCubit>(
            create: (context) => PrepareAppCubit(
                PreparAppImplemnt(apiServes: ApiServes(dio: creatdio())))
              ..fetchNews()
              ..isVoted(),
          ),
          BlocProvider<GetCandidateCubit>(
            create: (context) => GetCandidateCubit(
                CandidateRepoImplemnt(apiServes: ApiServes(dio: creatdio())))
              ..getAllCandidate(),
          ),
          //! can remove
          BlocProvider<GetCandidateInfoCubit>(
            create: (context) => GetCandidateInfoCubit(
                CandidateRepoImplemnt(apiServes: ApiServes(dio: creatdio()))),
          ),
        ],
        child: BlocBuilder<LayoutCubit, LayoutState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: Locale(isEnglish() ? 'en' : 'ar'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: ThemeData(scaffoldBackgroundColor: Colors.white),
              home: token != null && token != ""
                  ? HomeScreen()
                  : RegisterScreen(),
            );
          },
        ),
      ),
    );
  }
}

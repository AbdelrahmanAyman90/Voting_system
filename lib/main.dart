import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shard%20local/service_locator.dart';
import 'package:voting/data/repository/candidate/candidate_repo_implemntion.dart';
import 'package:voting/data/repository/event/event_repo_implemnt.dart';
import 'package:voting/data/repository/preparapp/prepar_app_repo_implment.dart';
import 'package:voting/data/repository/user_authorization/user_repo_implement.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/register_screen.dart';
import 'package:voting/presntion%20layer/Screens/Splash/splash_screen.dart';
import 'package:voting/presntion%20layer/Screens/test.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_viewmodel/cubit/get_candidate_cubit.dart';
import 'package:voting/presntion%20layer/view_model/layout_viewmodel/cubit/layout_cubit.dart';
import 'package:voting/presntion%20layer/view_model/news_viewmodel/cubit/news_cubit.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashNetwork.cashInitialization();
  await prepareDate();
  setupGetIt();
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
                apiServes: getIt.get<ApiServes>(),
              ),
            ),
          ),
          BlocProvider<NewsCubit>(
            create: (context) =>
                NewsCubit(getIt.get<PreparAppRepoImplemnt>())..fetchNews(),
          ),
          BlocProvider<EventCubit>(
              create: (context) => EventCubit(
                  EventRepoImplemnt(apiServes: getIt.get<ApiServes>()))
                ..fetchEvent()),
          BlocProvider<GetCandidateCubit>(
            create: (context) => GetCandidateCubit(
                CandidateRepoImplemnt(apiServes: getIt.get<ApiServes>()))
              ..getAllCandidate(),
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
                home: const SplashScreen());
          },
        ),
      ),
    );
  }
}

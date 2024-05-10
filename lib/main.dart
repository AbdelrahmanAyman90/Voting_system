import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';
import 'package:voting/presntion%20layer/view_model/layout_view_model/cubit/layout_cubit.dart';

Future<void> main() async {
  debugInvertOversizedImages = true;
  WidgetsFlutterBinding
      .ensureInitialized(); //مش هتنفذ حاجه غسر لما الي تحتك يكمل الاول
  await CashNetwork.cashInitialization(); //اول ما يفتح  التطبيق هيستدعيها علطول
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..changeLanguage("initial"),
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
            theme: ThemeData(
                scaffoldBackgroundColor:
                    const Color.fromARGB(253, 255, 255, 255)),
            home: Home_Screen(),
          );
        },
      ),
    );
  }
}

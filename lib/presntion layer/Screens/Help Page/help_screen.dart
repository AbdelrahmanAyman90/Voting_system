import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/service_locator.dart';
import 'package:voting/data/repository/qustion/qustion_repo_implment.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Help%20Page/Custom_Help_Wedgit/help_screen_body.dart';
import 'package:voting/presntion%20layer/view_model/qustion_viewmodel/cubit/qustion_cubit.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QustionCubit(QustionRepoImplemntion(getIt.get<ApiServes>())),
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.mainColor,
              ),
            ),
            title: Text(
              S.of(context).help,
              style: AppFonts.boldText(context, 24, AppColors.mainColor),
            ),
          ),
          body: const SingleChildScrollView(
              scrollDirection: Axis.vertical, child: HelpScreenBody())),
    );
  }
}

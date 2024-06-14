import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/data/repository/form_candidate/form_candidate_repo_implemnt.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/App_Form_Body.dart';
import 'package:voting/presntion%20layer/view_model/form_candidate_viewmodel/cubit/form_candidate_cubit.dart';

class ApplicationFormScreen extends StatefulWidget {
  const ApplicationFormScreen({super.key});

  @override
  State<ApplicationFormScreen> createState() => _FormState();
}

//! is form for add 7 fiels
class _FormState extends State<ApplicationFormScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCandidateCubit(
          FormCandidateRepoImplemntion(apiServes: ApiServes(dio: creatdio()))),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              S.of(context).Form,
              style: AppFonts.boldText(context, 24, AppColors.mainColor),
            ),
          ),
          body: const AppFormBody(),
        ),
      ),
    );
  }
}

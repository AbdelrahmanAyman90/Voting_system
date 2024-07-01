import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/not_start_screen/not_start_screen.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/resultwidget/result_body.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteing_mobile_layout.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';

class ResultMobileLayoutBody extends StatelessWidget {
  const ResultMobileLayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, S.of(context).result),
      body: context.read<EventCubit>().eventCases("elections") == "not start"
          ? const NotStart()
          : RusltBody(),
    );
  }
}

//S.of(context).result
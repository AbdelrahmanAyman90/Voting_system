import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shareWidget/global_widget.dart';
import 'package:voting/data/repository/preparapp/prepar_app_repo_implment.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/not_start_screen/not_start_screen.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/voting_body.dart';
import 'package:voting/presntion%20layer/view_model/cheack_isvoted_viewmodel/cubit/check_is_voted_cubit.dart';
import 'package:voting/presntion%20layer/view_model/event_viewmodel/cubit/event_cubit.dart';

//! todo more refactor
class VoteingMobileLayoutBody extends StatefulWidget {
  const VoteingMobileLayoutBody({Key? key}) : super(key: key);

  @override
  _VoteingMobileLayoutBodyState createState() =>
      _VoteingMobileLayoutBodyState();
}

class _VoteingMobileLayoutBodyState extends State<VoteingMobileLayoutBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, S.of(context).elesctions),
      //isvoted
      body: context.read<EventCubit>().eventCases("elections") == "not start"
          ? const NotStart()
          : BlocProvider(
              create: (context) => CheckIsVotedCubit(
                  PreparAppRepoImplemnt(apiServes: ApiServes(dio: creatdio()))),
              child: const VotingBody(),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/service_locator.dart';
import 'package:voting/data/repository/add_campiagn/add_campiagn_repo_implment.dart';
import 'package:voting/generated/l10n.dart';

import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/Upload_Form_Body.dart';
import 'package:voting/presntion%20layer/view_model/add_campiagn_viewmodel/cubit/add_campiagn_cubit.dart';

//!بيرفع الحمله هنا
class AddCampaignScreen extends StatefulWidget {
  const AddCampaignScreen({super.key});

  @override
  State<AddCampaignScreen> createState() => _AddCampaignScreenState();
}

class _AddCampaignScreenState extends State<AddCampaignScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCampiagnCubit(
          addCampiagnRepo:
              AddCampiagnRepoImplemntion(apiServes: getIt.get<ApiServes>())),
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
            body: const AddCampaignWidget()),
      ),
    );
  }
}

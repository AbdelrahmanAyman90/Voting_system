import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/Shard_Profile.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/custom_container_settimgs.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/custom_profile_header.dart';
import 'package:voting/presntion%20layer/view_model/layout_viewmodel/cubit/layout_cubit.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class ProfileMobileLayoutBody extends StatefulWidget {
  const ProfileMobileLayoutBody({super.key});

  @override
  State<ProfileMobileLayoutBody> createState() =>
      _ProfileMobileLayoutBodyState();
}

class _ProfileMobileLayoutBodyState extends State<ProfileMobileLayoutBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: CustomProfileHeader(
                    name: userName!,
                  )),
              isEnglish()
                  ? const SizedBox(
                      height: 10,
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              ProfileInfo(
                  title: S.of(context).personal_details,
                  icon1: Icons.perm_identity_rounded,
                  //todo api
                  text1: userName!,
                  icon2: Icons.assignment_ind_outlined,
                  //todo api
                  text2: userNationalId!,
                  icon3: Icons.calendar_month_outlined,
                  //todo api
                  text3: userAddress!),
              const SizedBox(
                height: 16,
              ),
              const CustomContainerSettings(),
              const SizedBox(
                height: 20,
              ),
              ProfileInfoButton(
                title: S.of(context).more_details,
                icon1: Icons.help_outline_outlined,
                icon2: Icons.lock_open,
                icon3: Icons.share,
                icon4: Icons.logout,
                text1: S.of(context).get_help,
                text2: S.of(context).change_password,
                text3: S.of(context).share,
                text4: S.of(context).log_out,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

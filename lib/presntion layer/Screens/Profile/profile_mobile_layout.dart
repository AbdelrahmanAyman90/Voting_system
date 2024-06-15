import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Api/cubit/user_cubit.dart';
import 'package:voting/presntion%20layer/Api/models/sign_in_model.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/Shard_Profile.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/custom_container_settimgs.dart';
import 'package:voting/presntion%20layer/Screens/Profile/Custom_Profile/custom_profile_header.dart';

class ProfileMobileLayoutBody extends StatefulWidget {
  const ProfileMobileLayoutBody({super.key});

  @override
  State<ProfileMobileLayoutBody> createState() =>
      _ProfileMobileLayoutBodyState();
}

class _ProfileMobileLayoutBodyState extends State<ProfileMobileLayoutBody> {
  SignInModel? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is GetUserDataFaliur) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('fail')));
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: state is GetUserDataLoading
                  ? const CircularProgressIndicator()
                  : state is GetUserDataSuccess
                      ? SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: CustomProfileHeader()),
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
                                text1: state.user.data!.user!.gender ?? "",
                                icon2: Icons.assignment_ind_outlined,
                                //todo api
                                text2: state.user.data!.user!.nationalId ?? "",
                                icon3: Icons.calendar_month_outlined,
                                //todo api
                                text3: DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(
                                        state.user.data!.user!.dateOfBirth ??
                                            "")),
                              ),
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
                        )
                      : Container());
        },
      ),
    );
  }
}

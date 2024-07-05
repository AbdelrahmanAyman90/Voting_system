import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/Shared/shard%20local/service_locator.dart';
import 'package:voting/Shared/shareWidget/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/data/models/candidate/candidate_model.dart';
import 'package:voting/data/repository/user_voting/user_vote_repo_implemnt.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/coustom_password.dart';
import 'package:voting/presntion%20layer/Screens/thankesVotingScreen/thanks_voting_screen.dart';
import 'package:voting/presntion%20layer/Screens/voteingScreen/voteingwidget/custom_candidate_widget.dart';

import 'package:voting/presntion%20layer/view_model/user_vote_viewmodel/cubit/user_vote_cubit.dart';

class ConfirmVotingBody extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ConfirmVotingBody({super.key, required this.candataeDataSelected});
  CandidateModel candataeDataSelected;
  TextEditingController ConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserVoteCubit>(
          create: (context) => UserVoteCubit(
            uservote: UserVotingRepoImplemntion(
              apiServes: getIt.get<ApiServes>(),
            ),
          ),
        ),
        // Add other BlocProviders here as needed
      ],
      child: ListView(
        children: [
          ShowCandidate(
            isSelected: true,
            bio: candataeDataSelected.job ?? "dont Have",
            image: candataeDataSelected.image!,
            name: candataeDataSelected.name!,
          ),
          const SizedBox(height: 80),
          _buildPasswordSection(context),
          const SizedBox(height: 70),
          _buildConfirmButton(context),
          const SizedBox(height: 10),
          _buildCancelButton(context),
        ],
      ),
    );
  }

/*

wedgit fun

*/
  Widget _buildPasswordSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            S.of(context).enter_password,
            style: AppFonts.semiBoldText(context, 18, Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).hint_password,
          ),
          const SizedBox(height: 18),
          Form(
            key: _formKey,
            child: CustomPassowrdText(
              controller: ConfirmPassword,
              hintText: S.of(context).password,
              validator: (value) {
                if (ConfirmPassword.text.isEmpty) {
                  return S.of(context).passord_error;
                }
                //  else if (ConfirmPassword.text != currentPassword) {
                //   return "كلمه السر غير صحيحه";
                // }
              },
            ),
          ),
        ],
      ),
    );
  }

//todo
  Widget _buildConfirmButton(BuildContext context) {
    return BlocConsumer<UserVoteCubit, UserVoteState>(
      listener: (context, state) async {
        if (state is UserVoteSuccsess) {
          context.loaderOverlay.hide();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ThankesToVoteScreen()),
          );
          await CashNetwork.InsertToCash(key: "user_vote", value: "true");
        } else if (state is UserVoteFail) {
          context.loaderOverlay.hide();
          MyAppStuts.showSnackBar(context, state.errorMassage);
        } else {
          context.loaderOverlay.show(
            widgetBuilder: (progress) {
              return MyAppStuts.myLooding();
            },
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonWidget(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                //todo cubit succsess and isvoted true
                try {
                  await context.read<UserVoteCubit>().UserVoting(
                      candadateId: candataeDataSelected.sId,
                      confirmPassword: ConfirmPassword.text);
                } on Exception catch (e) {
                  MyAppStuts.showSnackBar(context, "Time end");
                }
              }
            },
            word: S.of(context).confirm_voting_button,
            color: const Color(0xFF008753),
            textcolor: Colors.white,
          ),
        );
      },
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ButtonWidget(
        onPressed: () {
          Navigator.pop(context);
        },
        word: S.of(context).cancel_button,
        color: Colors.white,
        textcolor: const Color(0xFF008753),
      ),
    );
  }
}

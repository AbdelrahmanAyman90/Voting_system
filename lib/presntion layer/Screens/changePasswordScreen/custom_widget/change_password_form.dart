import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/shard%20local/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/coustom_password.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  TextEditingController newPasswordControllar = TextEditingController();
  TextEditingController confirmeNPasswordControllar = TextEditingController();

  final keyform = GlobalKey<FormState>();
  TextEditingController oldPasswordControllar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: keyform,
        child: Column(
          children: [
            CustomPassowrdText(
                hintText: S.of(context).old_pas,
                validator: (value) {
                  if (oldPasswordControllar.text.isEmpty) {
                    return S.of(context).passord_error;
                  } else if (value!.length < 8) {
                    return S.of(context).error_length_password;
                  } else {
                    return null;
                  }
                },
                controller: oldPasswordControllar),
            const SizedBox(
              height: 10,
            ),
            CustomPassowrdText(
              hintText: S.of(context).new_pas,
              validator: (value) {
                if (newPasswordControllar.text.isEmpty) {
                  return S.of(context).passord_error;
                } else if (value!.length < 8) {
                  return S.of(context).error_length_password;
                } else {
                  return null;
                }
              },
              controller: newPasswordControllar,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPassowrdText(
              hintText: S.of(context).conf_pass,
              validator: (value) {
                if (newPasswordControllar.text.isNotEmpty) {
                  if (value != newPasswordControllar.text) {
                    return S.of(context).error_not_match;
                  } else {
                    return null;
                  }
                } else {
                  return S.of(context).Confirm_password_is_required;
                }
              },
              controller: confirmeNPasswordControllar,
            ),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<UserAuthorizationCubit, UserAuthorizationState>(
              listener: (context, state) {
                if (state is UserChangePasswordFail) {
                  MyAppStuts.showSnackBar(context, state.errorMassage);
                } else if (state is UseChangePasswordSucsses) {
                  Navigator.pop(context);
                  MyAppStuts.succsessShowSnackBar(
                      context, S.of(context).change_sucsses);
                }
              },
              builder: (context, state) {
                return state is UserChangePasswordLooding
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainColor,
                        ),
                      )
                    : Button(
                        text: S.of(context).Submit,
                        color: AppColors.mainColor,
                        fontsize: 16,
                        width: 310,
                        height: 45,
                        onPressed: () async {
                          if (keyform.currentState!.validate()) {
                            await context
                                .read<UserAuthorizationCubit>()
                                .userChangePassword(
                                  newpassword: newPasswordControllar.text,
                                  oldpassword: oldPasswordControllar.text,
                                );
                          }
                        },
                        textcolor: Colors.white,
                      );
              },
            ),
          ],
        ));
  }
}

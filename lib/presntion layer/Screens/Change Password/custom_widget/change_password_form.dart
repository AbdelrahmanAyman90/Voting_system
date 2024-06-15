import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Api/cubit/user_cubit.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/coustom_password.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  TextEditingController confirmPasswordController = TextEditingController();

  String? validatePasswordMatch(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is required.';
    } else if (password != confirmPassword) {
      return 'Passwords do not match.';
    }
    return null; // Passwords match
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const HomeScreen()),
          // );
          Navigator.pop(context);
          context.read<UserCubit>().oldPasswordController.clear();
          context.read<UserCubit>().newPasswordController.clear();
          confirmPasswordController.clear();
        } else if (state is ChangePasswordFaliur) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessagee)));
        }
      },
      builder: (context, state) {
        return Form(
            key: context.read<UserCubit>().changePasswordFormKey,
            child: Column(
              children: [
                CustomPassowrdText(
                    hintText: 'Old Password',
                    validator: (value) {
                      if (context
                          .read<UserCubit>()
                          .oldPasswordController
                          .text
                          .isEmpty) {
                        return S.of(context).passord_error;
                      } else {
                        return null;
                      }
                    },
                    controller:
                        context.read<UserCubit>().oldPasswordController),
                const SizedBox(
                  height: 10,
                ),
                CustomPassowrdText(
                    hintText: 'New Password',
                    validator: (value) {
                      if (context
                          .read<UserCubit>()
                          .newPasswordController
                          .text
                          .isEmpty) {
                        return S.of(context).passord_error;
                      } else if (value!.length < 8) {
                        return 'Password must be at least 8 characters or numbers';
                      } else {
                        return null;
                      }
                    },
                    controller:
                        context.read<UserCubit>().newPasswordController),
                const SizedBox(
                  height: 10,
                ),
                CustomPassowrdText(
                    hintText: 'Confirm Password',
                    validator: (value) => validatePasswordMatch(
                        context.read<UserCubit>().newPasswordController.text,
                        value!),
                    controller: confirmPasswordController),
                const SizedBox(
                  height: 50,
                ),
                state is ChangePasswordLoading
                    ? const CircularProgressIndicator()
                    : Button(
                        text: 'Submit',
                        color: AppColors.mainColor,
                        fontsize: 16,
                        width: 310,
                        height: 45,
                        onPressed: () {
                          context.read<UserCubit>().changePassword();
                        },
                        textcolor: Colors.white,
                      )
              ],
            ));
      },
    );
  }
}

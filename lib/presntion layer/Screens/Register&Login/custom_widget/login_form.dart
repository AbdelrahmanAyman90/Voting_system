import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Api/cubit/user_cubit.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/custom_forgot_password.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/custom_text_field.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/coustom_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
          context.read<UserCubit>().signInNationalIdController.clear();
          context.read<UserCubit>().signInPasswordController.clear();
        } else if (state is SignInFaliur) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Form(
            key: context.read<UserCubit>().signInpFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "National ID",
                  controller:
                      context.read<UserCubit>().signInNationalIdController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomPassowrdText(
                  hintText: S.of(context).password,
                  controller:
                      context.read<UserCubit>().signInPasswordController,
                  validator: (value) {
                    if (context
                        .read<UserCubit>()
                        .signInPasswordController
                        .text
                        .isEmpty) {
                      return S.of(context).passord_error;
                    } else {
                      return null;
                    }
                  },
                ),
                const ForgotPassword(),
                const SizedBox(
                  height: 20,
                ),
                state is SignInLoading
                    ? const CircularProgressIndicator()
                    : Button(
                        text: 'Log in',
                        color: AppColors.mainColor,
                        fontsize: 18,
                        width: 310,
                        height: 45,
                        onPressed: () {
                          context.read<UserCubit>().signIn();
                        },
                        textcolor: Colors.white,
                      )
              ],
            ));
      },
    );
  }
}

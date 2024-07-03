import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/shareWidget/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/main.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/custom_forgot_password.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/custom_text_field.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/coustom_password.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final keyform = GlobalKey<FormState>();

  TextEditingController nationalId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserAuthorizationCubit, UserAuthorizationState>(
      listener: (context, state) {
        if (state is UserAuthorizationRegisterSucsses) {
          context.loaderOverlay.hide();
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => HomeScreen(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        } else if (state is UserAuthorizationRegisterFail) {
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
      child: Form(
        key: keyform,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: S.of(context).National_ID,
              controller: nationalId,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPassowrdText(
              hintText: S.of(context).password,
              controller: password,
              validator: (value) {
                if (password.text.isEmpty) {
                  return S.of(context).passord_error;
                } else if (value!.length < 8) {
                  return S.of(context).error_length_password;
                } else {
                  return null;
                }
              },
            ),
            const ForgotPassword(),
            const SizedBox(
              height: 20,
            ),
            Button(
              text: S.of(context).login,
              color: AppColors.mainColor,
              fontsize: 18,
              width: 310,
              height: 45,
              onPressed: () {
                if (keyform.currentState!.validate()) {
                  context.read<UserAuthorizationCubit>().userLogin(
                      nationalId: nationalId.text, password: password.text);
                }
              },
              textcolor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

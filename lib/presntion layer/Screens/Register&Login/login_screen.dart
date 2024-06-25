import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/data/repository/user_authorization/user_repo_implement.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/login_body.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: LoginBody(),
        ),
      ),
    );
  }
}

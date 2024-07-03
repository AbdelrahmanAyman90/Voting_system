import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/changePasswordScreen/custom_widget/change_password_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: ChangePasswordBody(),
      ),
    ));
  }
}

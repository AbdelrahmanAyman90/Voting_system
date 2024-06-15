import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: RegisterBody(),
        ),
      ),
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/data/repository/user_authorization/user_repo_implement.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/take_photo_body.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class TakePhoto extends StatelessWidget {
  TakePhoto(
      {super.key,
      required this.selectedNationalIdImage,
      required this.nationalId,
      required this.password});
  String nationalId;
  String password;
  PlatformFile? selectedNationalIdImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: TakePhotoBody(
        nationalId: nationalId,
        password: password,
        selectedNationalIdImage: selectedNationalIdImage,
      )),
    ));
  }
}

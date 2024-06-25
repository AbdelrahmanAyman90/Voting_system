import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/shard_container.dart';

import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/custom_text_field.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/upload_imgs_button.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/take_real_time_photo.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/coustom_password.dart';
import 'package:voting/presntion%20layer/view_model/user_view_model/cubit/user_authorization_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController confirmPasswordController = TextEditingController();
  PlatformFile? _selectedNationalIdImage;
  final keyform = GlobalKey<FormState>();

  TextEditingController nationalId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool _isUploadImage = false;

  TextEditingController textAreaControllereducation = TextEditingController();
  void handleIdImgUpload(PlatformFile? file) {
    setState(() {
      _selectedNationalIdImage = file;
    });
  }

  void validateForm(bool isValid) {
    setState(() {
      if (_selectedNationalIdImage != null) {
        _isUploadImage = isValid;
      } else {
        MyAppStuts.showSnackBar(context, 'Please upload all files!');
      }
    });
  }

  // String? validatePasswordMatch(String password, String confirmPassword) {
  //   if (confirmPassword.isEmpty) {
  //     return 'Confirm password is required.';
  //   } else if (password != confirmPassword) {
  //     return 'Passwords do not match.';
  //   }
  //   return null; // Passwords match
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: keyform,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: "National ID",
              controller: nationalId,
            ),
            const SizedBox(
              height: 10,
            ),
            UploadImgsButton(
              hintText: "Upload ID",
              selectedFile: _selectedNationalIdImage,
              onFileSelected: handleIdImgUpload,
              onValidationChanged: validateForm,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPassowrdText(
              hintText: "password",
              controller: password,
              validator: (value) {
                if (password.text.isEmpty) {
                  return S.of(context).passord_error;
                } else if (value!.length < 8) {
                  return 'Password must be at least 8 characters or numbers';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomPassowrdText(
              hintText: "Confirm password",
              controller: confirmPasswordController,
              validator: (value) {
                if (password.text.isNotEmpty) {
                  if (value != password.text) {
                    return "not matches password";
                  } else {
                    return null;
                  }
                } else {
                  return "Confirm password is required";
                }
              },
            ),
            const SizedBox(
              height: 70,
            ),
            Button(
              text: 'Take Realtime photo',
              color: AppColors.mainColor,
              fontsize: 16,
              width: 310,
              height: 45,
              onPressed: () {
                if (_isUploadImage) {
                  if (keyform.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TakePhoto(
                                nationalId: nationalId.text,
                                password: password.text,
                                selectedNationalIdImage:
                                    _selectedNationalIdImage,
                              )),
                    );
                    // context.read<UserAuthorizationCubit>().userRegister(
                    //     nationalId: nationalId.text,
                    //     password: password.text,
                    //     nationalIdImage: _selectedNationalIdImage!,
                    //     personalImage: _selectPersonalImage!);
                  }
                } else {
                  MyAppStuts.showSnackBar(context, "upload all image");
                }
              },
              textcolor: Colors.white,
            )
          ],
        ));
  }
}

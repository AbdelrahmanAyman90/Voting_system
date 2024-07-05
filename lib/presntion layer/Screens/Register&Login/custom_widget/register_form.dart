import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/shareWidget/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';

import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/custom_text_field.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/upload_imgs_button.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/take_real_time_photo.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/coustom_password.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
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
            UploadImgsButton(
              hintText: S.of(context).Upload_ID,
              selectedFile: _selectedNationalIdImage,
              onFileSelected: handleIdImgUpload,
              onValidationChanged: validateForm,
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
            const SizedBox(
              height: 10,
            ),
            CustomPassowrdText(
              hintText: S.of(context).Confirm_password,
              controller: confirmPasswordController,
              validator: (value) {
                if (password.text.isNotEmpty) {
                  if (value != password.text) {
                    return S.of(context).error_not_match;
                  } else {
                    return null;
                  }
                } else {
                  return S.of(context).Confirm_password_is_required;
                }
              },
            ),
            const SizedBox(
              height: 70,
            ),
            Button(
              text: S.of(context).Take_Realtime_photo,
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
                  }
                } else {
                  MyAppStuts.showSnackBar(
                      context, S.of(context).upload_all_image);
                }
              },
              textcolor: Colors.white,
            )
          ],
        ));
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/shard_container.dart';
import 'package:voting/presntion%20layer/Screens/Forms/submitted_successfully.dart';

class UploadFormBody extends StatefulWidget {
  const UploadFormBody({super.key});

  @override
  State<UploadFormBody> createState() => _UploadFormBodyState();
}

class _UploadFormBodyState extends State<UploadFormBody> {
  TextEditingController textAreaController1 = TextEditingController();
  TextEditingController textAreaController2 = TextEditingController();
  TextEditingController inputLinkController = TextEditingController();
  final keyform = GlobalKey<FormState>();

  PlatformFile? _selectedFile;
  bool _isFormValid = false;

  void handleFileUpload(PlatformFile? file) {
    setState(() {
      _selectedFile = file;
    });
  }

  void validateForm(bool isValid) {
    setState(() {
      if (
          //_isFormValid =
          _selectedFile != null) {
        _isFormValid = isValid;
      }
    });
  }

  void submitForm() {
    if (_isFormValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              const SubmittedSuccessfullyScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload your vedio.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SingleChildScrollView(
        child: Form(
          key: keyform,
          child: Container(
            //width: MediaQuery.of(context).size.width * 335 / 375,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/MP4 Image.svg',
                    width: 60,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    S.of(context).upload_your_campaign_form,
                    style: AppFonts.regularText(
                        context, 14, AppColors.secondaryTextColor),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  UploadBtn(
                      selectedFile: _selectedFile,
                      textBtn: S.of(context).upload_your_video,
                      onFileSelected: handleFileUpload,
                      onValidationChanged: validateForm),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: inputLinkController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*require';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: S.of(context).video_link,
                      hintStyle: AppFonts.regularText(
                          context, 14, AppColors.secondaryTextColor),
                      focusedBorder: borderOfButton(),
                      enabledBorder: borderOfButton(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextArea(
                      controller: textAreaController1, text: S.of(context).bio),
                  const SizedBox(
                    height: 10,
                  ),
                  TextArea(
                      controller: textAreaController2,
                      text: S.of(context).goals),
                  const SizedBox(
                    height: 50,
                  ),
                  Button(
                      text: S.of(context).Submit,
                      color: AppColors.mainColor,
                      fontsize: 20,
                      width: 265,
                      height: 45,
                      onPressed: () {
                        if (keyform.currentState!.validate()) {
                          return submitForm();
                        }
                      },
                      textcolor: Colors.white),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

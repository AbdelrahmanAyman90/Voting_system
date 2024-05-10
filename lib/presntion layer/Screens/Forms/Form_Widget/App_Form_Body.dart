import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/shard_container.dart';
import 'package:voting/presntion%20layer/Screens/Home/home_screen.dart';

class AppFormBody extends StatefulWidget {
  const AppFormBody({super.key});

  @override
  State<AppFormBody> createState() => _AppFormBodyState();
}

class _AppFormBodyState extends State<AppFormBody> {
  PlatformFile? _selectedFile1;
  PlatformFile? _selectedFile2;
  PlatformFile? _selectedFile3;
  PlatformFile? _selectedFile4;
  PlatformFile? _selectedFile5;
  PlatformFile? _selectedFile6;
  PlatformFile? _selectedFile7;
  PlatformFile? _selectedFile8;

  bool _isFormValid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Container(
          //width: MediaQuery.of(context).size.width * 335 / 375,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContainerContent(
                  onFileSelected: _handleFileUpload1,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques1,
                  text: S.of(context).upload_ques1,
                ),
                ContainerContent(
                  onFileSelected: _handleFileUpload2,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques2,
                  text: S.of(context).upload_ques2,
                ),
                ContainerContent(
                  onFileSelected: _handleFileUpload3,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques3,
                  text: S.of(context).upload_ques3,
                ),
                ContainerContent(
                  onFileSelected: _handleFileUpload4,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques4,
                  text: S.of(context).upload_ques4,
                ),
                ContainerContent(
                  onFileSelected: _handleFileUpload5,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques5,
                  text: S.of(context).upload_ques5,
                ),
                ContainerContent(
                  onFileSelected: _handleFileUpload6,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques6,
                  text: S.of(context).upload_ques6,
                ),
                const SizedBox(
                  height: 15,
                ),
                UploadBtn(
                  selectedFile: _selectedFile7,
                  onFileSelected: _handleFileUpload7,
                  onValidationChanged: _validateForm,
                  textBtn: S.of(context).upload_Payment_receipt,
                ),
                const SizedBox(
                  height: 15,
                ),
                UploadBtn(
                  selectedFile: _selectedFile8,
                  textBtn: S.of(context).upload_personal_photo,
                  onFileSelected: _handleFileUpload8,
                  onValidationChanged: _validateForm,
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                    text: S.of(context).Submit,
                    color: AppColors.mainColor,
                    fontsize: 20,
                    width: 265,
                    height: 45,
                    onPressed: _submitForm,
                    textcolor: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleFileUpload1(PlatformFile? file) {
    setState(() {
      _selectedFile1 = file;
    });
  }

  void _handleFileUpload2(PlatformFile? file) {
    setState(() {
      _selectedFile2 = file;
    });
  }

  void _handleFileUpload3(PlatformFile? file) {
    setState(() {
      _selectedFile3 = file;
    });
  }

  void _handleFileUpload4(PlatformFile? file) {
    setState(() {
      _selectedFile4 = file;
    });
  }

  void _handleFileUpload5(PlatformFile? file) {
    setState(() {
      _selectedFile5 = file;
    });
  }

  void _handleFileUpload6(PlatformFile? file) {
    setState(() {
      _selectedFile6 = file;
    });
  }

  void _handleFileUpload7(PlatformFile? file) {
    setState(() {
      _selectedFile7 = file;
    });
  }

  void _handleFileUpload8(PlatformFile? file) {
    setState(() {
      _selectedFile8 = file;
    });
  }

  void _validateForm(bool isValid) {
    setState(() {
      if (_selectedFile1 != null &&
          _selectedFile2 != null &&
          _selectedFile3 != null &&
          _selectedFile4 != null &&
          _selectedFile5 != null &&
          _selectedFile6 != null &&
          _selectedFile7 != null &&
          _selectedFile8 != null) _isFormValid = isValid;
    });
  }

  void _submitForm() {
    if (_isFormValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload all files!'),
        ),
      );
    }
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/view_model/form_candidate_viewmodel/cubit/form_candidate_cubit.dart';

//!the custom widget with upload button
class ContainerContent extends StatefulWidget {
  final String ques;
  final String text;
  final int indexForSoretImage;

  final void Function(PlatformFile?) onFileSelected;
  final void Function(bool) onValidationChanged;
  const ContainerContent({
    super.key,
    required this.indexForSoretImage,
    required this.ques,
    required this.text,
    required this.onFileSelected,
    required this.onValidationChanged,
  });

  @override
  State<ContainerContent> createState() => _ContainerContentState();
}

class _ContainerContentState extends State<ContainerContent> {
  String groupValue = " ";
  PlatformFile? selectedFile;
  bool _isFormValid = true;

  void _handleFileUpload(PlatformFile? file) {
    setState(() {
      selectedFile = file;
      widget.onFileSelected(file);
      widget.onValidationChanged(_isFormValid);
    });
  }

  // void _handleRadioChange(String? value) {
  //   setState(() {
  //     groupValue = value ?? "";
  //     _validateForm();
  //     widget.onValidationChanged();
  //   });
  // }

  void _validateForm(
    bool isValid,
  ) {
    setState(() {
      _isFormValid = selectedFile != null && groupValue.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            widget.ques,
            style: AppFonts.semiBoldText(
              context,
              14,
              Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Radio(
                value: 'Yes',
                groupValue: groupValue,
                activeColor: AppColors.navigationBarColor,
                fillColor: MaterialStatePropertyAll(AppColors.mainColor),
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                    _validateForm(_isFormValid);
                  });
                }),
            Text(
              S.of(context).Yes,
              style: AppFonts.regularText(context, 14, Colors.black),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
                value: 'No',
                groupValue: groupValue,
                activeColor: AppColors.navigationBarColor,
                fillColor: MaterialStatePropertyAll(AppColors.mainColor),
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                    _validateForm(_isFormValid);
                  });
                }),
            Text(
              S.of(context).No,
              style: AppFonts.regularText(context, 14, Colors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        UploadBtn(
            indexForSoretImage: widget.indexForSoretImage,
            selectedFile: selectedFile,
            textBtn: widget.text,
            onFileSelected: _handleFileUpload,
            onValidationChanged: _validateForm),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}

//!upload button
class UploadBtn extends StatefulWidget {
  final String textBtn;
  final void Function(PlatformFile?) onFileSelected;
  final void Function(bool) onValidationChanged;
  final PlatformFile? selectedFile;
  final int indexForSoretImage;
  const UploadBtn(
      {super.key,
      required this.indexForSoretImage,
      required this.textBtn,
      required this.onFileSelected,
      required this.onValidationChanged,
      required this.selectedFile});

  @override
  State<UploadBtn> createState() => _UploadBtnState();
}

class _UploadBtnState extends State<UploadBtn> {
  // String? selectedFileName;

  PlatformFile? file;

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        file = result.files.first;
        //! this for to gather all file and send to api
        context
            .read<FormCandidateCubit>()
            .sortedImage(file, index: widget.indexForSoretImage);
        widget.onFileSelected(file);
        widget.onValidationChanged(true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        height: MediaQuery.of(context).size.height * 50 / 812,
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(10)),
        child: TextButton(
            onPressed: () {
              _openFilePicker();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      file != null ? file!.name : widget.textBtn,
                      style: AppFonts.regularText(
                          context, 12, AppColors.secondaryTextColor),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.file_upload_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class TextArea extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const TextArea({super.key, required this.text, required this.controller});

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return '*require';
        } else {
          return null;
        }
      },
      controller: widget.controller,
      maxLines: null,
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle:
            AppFonts.regularText(context, 14, AppColors.secondaryTextColor),
        border: const OutlineInputBorder(),
        focusedBorder: borderOfButton(),
        enabledBorder: borderOfButton(),
      ),
    );
  }
}

OutlineInputBorder borderOfButton() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.borderColor),
    borderRadius: const BorderRadius.all(
      Radius.circular(15),
    ),
  );
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';

class UploadImgsButton extends StatefulWidget {
  final void Function(PlatformFile?) onFileSelected;
  final void Function(bool) onValidationChanged;
  final PlatformFile? selectedFile;
  final String hintText;

  const UploadImgsButton(
      {super.key,
      required this.onFileSelected,
      required this.onValidationChanged,
      required this.selectedFile,
      required this.hintText});

  @override
  State<UploadImgsButton> createState() => UploadIdButtonState();
}

class UploadIdButtonState extends State<UploadImgsButton> {
  PlatformFile? file;

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false, // Only allow one file selection
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        file = result.files.first;
        widget.onFileSelected(file);
        widget.onValidationChanged(true);
      });
    }
  }

  void clearFileSelection() {
    setState(() {
      file = null;
      widget.onFileSelected(null);
      widget.onValidationChanged(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        //height: MediaQuery.of(context).size.height * 50 / 812,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderColor)),
        child: TextButton(
            onPressed: () {
              _openFilePicker();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      file != null ? file!.name : widget.hintText,
                      style: AppFonts.regularText(
                          context, 16, AppColors.secondaryTextColor),
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

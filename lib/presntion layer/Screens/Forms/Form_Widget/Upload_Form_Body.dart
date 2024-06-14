import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/shard%20local/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/shard_container.dart';
import 'package:voting/presntion%20layer/Screens/Forms/submitted_successfully.dart';
import 'package:voting/presntion%20layer/view_model/add_campiagn_viewmodel/cubit/add_campiagn_cubit.dart';

class AddCampaignWidget extends StatefulWidget {
  const AddCampaignWidget({super.key});

  @override
  State<AddCampaignWidget> createState() => _AddCampaignWidgetState();
}

//! الصفحه الي بيرفع فيها الحمله
class _AddCampaignWidgetState extends State<AddCampaignWidget> {
  TextEditingController textAreaControllerBio = TextEditingController();
  TextEditingController textAreaControllerGoals = TextEditingController();
  TextEditingController? inputLinkController = TextEditingController();
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

  // void submitForm() {
  //   if (_isFormValid) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute<void>(
  //         builder: (BuildContext context) =>
  //             const SubmittedSuccessfullyScreen(),
  //       ),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Please upload your vedio.'),
  //       ),
  //     );
  //   }
  // }

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
                  UploadBtnVideo(
                    selectedFile: _selectedFile,
                    textBtn: S.of(context).upload_your_video,
                    onFileSelected: handleFileUpload,
                    onValidationChanged: validateForm,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: inputLinkController,
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
                      controller: textAreaControllerBio,
                      text: S.of(context).bio),
                  const SizedBox(
                    height: 10,
                  ),
                  TextArea(
                      controller: textAreaControllerGoals,
                      text: S.of(context).goals),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocListener<AddCampiagnCubit, AddCampiagnState>(
                    listener: (context, state) {
                      if (state is AddCampiagnLooding) {
                        context.loaderOverlay.show(
                          widgetBuilder: (progress) {
                            return MyAppStuts.myLooding();
                          },
                        );
                      } else if (state is AddCampiagnFail) {
                        context.loaderOverlay.hide();
                        MyAppStuts.showSnackBar(context, state.errorMassage);
                      } else {
                        //todo navigat for alert that wait for aprrov
                        context.loaderOverlay.hide();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SubmittedSuccessfullyScreen(),
                          ),
                        );
                      }
                    },
                    child: Button(
                      text: S.of(context).Submit,
                      color: AppColors.mainColor,
                      fontsize: 20,
                      width: 265,
                      height: 45,
                      onPressed: () async {
                        if (keyform.currentState!.validate() && _isFormValid) {
                          await context.read<AddCampiagnCubit>().addCampiagn(
                              bio: textAreaControllerBio.text,
                              goals: textAreaControllerGoals.text,
                              video: _selectedFile,
                              link: inputLinkController?.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please upload your vedio.'),
                            ),
                          );
                        }
                      },
                      textcolor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UploadBtnVideo extends StatefulWidget {
  final String textBtn;
  final void Function(PlatformFile?) onFileSelected;
  final void Function(bool) onValidationChanged;
  final PlatformFile? selectedFile;

  const UploadBtnVideo(
      {super.key,
      required this.textBtn,
      required this.onFileSelected,
      required this.onValidationChanged,
      required this.selectedFile});

  @override
  State<UploadBtnVideo> createState() => _UploadBtnVideoState();
}

class _UploadBtnVideoState extends State<UploadBtnVideo> {
  // String? selectedFileName;

  PlatformFile? file;

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.video);

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        file = result.files.first;

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

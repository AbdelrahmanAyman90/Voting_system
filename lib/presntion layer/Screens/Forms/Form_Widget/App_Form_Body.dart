import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/Shared/shard%20local/stuts_app.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Forms/Form_Widget/shard_container.dart';
import 'package:voting/presntion%20layer/view_model/check_iscandidate_viewmodel/cubit/cheack_is_candidate_cubit.dart';
import 'package:voting/presntion%20layer/view_model/form_candidate_viewmodel/cubit/form_candidate_cubit.dart';
import 'package:voting/presntion%20layer/view_model/prepare_app_viewmodel/cubit/news_cubit.dart';

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

  TextEditingController textAreaControllername = TextEditingController();
  TextEditingController textAreaControllerjob = TextEditingController();
  TextEditingController textAreaControllereducation = TextEditingController();
  //PlatformFile? _selectedFile8;
  final keyform = GlobalKey<FormState>();

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
                Form(
                  key: keyform,
                  child: Container(
                    child: Column(
                      children: [
                        TextArea(
                            controller: textAreaControllername,
                            text: S.of(context).enter_name),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextArea(
                            controller: textAreaControllerjob,
                            text: S.of(context).enter_job),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextArea(
                            controller: textAreaControllereducation,
                            text: S.of(context).enter_educ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                ContainerContent(
                  indexForSoretImage: 0,
                  onFileSelected: _handleFileUpload1,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques1,
                  text: S.of(context).upload_ques1,
                ),
                ContainerContent(
                  indexForSoretImage: 2,
                  onFileSelected: _handleFileUpload2,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques2,
                  text: S.of(context).upload_ques2,
                ),
                ContainerContent(
                  indexForSoretImage: 3,
                  onFileSelected: _handleFileUpload3,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques3,
                  text: S.of(context).upload_ques3,
                ),
                ContainerContent(
                  indexForSoretImage: 4,
                  onFileSelected: _handleFileUpload4,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques4,
                  text: S.of(context).upload_ques4,
                ),
                ContainerContent(
                  indexForSoretImage: 1,
                  onFileSelected: _handleFileUpload5,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques5,
                  text: S.of(context).upload_ques5,
                ),
                ContainerContent(
                  indexForSoretImage: 5,
                  onFileSelected: _handleFileUpload6,
                  onValidationChanged: _validateForm,
                  ques: S.of(context).ques6,
                  text: S.of(context).upload_ques6,
                ),
                const SizedBox(
                  height: 15,
                ),
                UploadBtn(
                  indexForSoretImage: 6,
                  selectedFile: _selectedFile7,
                  onFileSelected: _handleFileUpload7,
                  onValidationChanged: _validateForm,
                  textBtn: S.of(context).upload_Payment_receipt,
                ),
                const SizedBox(
                  height: 15,
                ),
                UploadBtn(
                  indexForSoretImage: 7,
                  selectedFile: _selectedFile8,
                  textBtn: S.of(context).upload_personal_photo,
                  onFileSelected: _handleFileUpload8,
                  onValidationChanged: _validateForm,
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocListener<FormCandidateCubit, FormCandidateState>(
                  listener: (context, state) async {
                    if (state is FormCandidateLoodin) {
                      context.loaderOverlay.show(
                        widgetBuilder: (progress) {
                          return MyAppStuts.myLooding();
                        },
                      );
                    } else if (state is FormCandidateFail) {
                      context.loaderOverlay.hide();
                      MyAppStuts.showSnackBar(context, state.errorMassage);
                    } else {
                      //todo navigat for alert that wait for aprrov
                      context.loaderOverlay.hide();
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) =>
                            SuccsesAlert(message: S.of(context).hint_form),
                      );
                      await CashNetwork.InsertToCash(
                          key: "user_candidate_self", value: "true");
                    }
                  },
                  child: Button(
                    text: S.of(context).Submit,
                    color: AppColors.mainColor,
                    fontsize: 20,
                    width: 265,
                    height: 45,
                    onPressed: _submitForm,
                    textcolor: Colors.white,
                  ),
                ),
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
    setState(
      () {
        if (_selectedFile1 != null &&
            _selectedFile2 != null &&
            _selectedFile3 != null &&
            _selectedFile4 != null &&
            _selectedFile5 != null &&
            _selectedFile6 != null &&
            _selectedFile7 != null &&
            _selectedFile8 != null) _isFormValid = isValid;
      },
    );
  }

  Future<void> _submitForm() async {
    if (_isFormValid && keyform.currentState!.validate()) {
      context.read<FormCandidateCubit>().addCandidate(
            name: textAreaControllername.text,
            job: textAreaControllerjob.text,
            education: textAreaControllereducation.text,
          );
    } else {
      MyAppStuts.showSnackBar(context, S.of(context).shoulad_upload_all);
    }
  }
}

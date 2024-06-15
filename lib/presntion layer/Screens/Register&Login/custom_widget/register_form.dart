import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Api/cubit/user_cubit.dart';
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

  void handleIdImgUpload(PlatformFile? file) {
    setState(() {
      context.read<UserCubit>().idImage = file;
    });
  }

  void handlePersonalImgUpload(PlatformFile? file) {
    setState(() {
      context.read<UserCubit>().personalImage = file;
    });
  }

  void validateForm(bool isValid) {
    setState(() {
      if (context.read<UserCubit>().idImage != null &&
          context.read<UserCubit>().personalImage != null) {
        context.read<UserCubit>().isFormValid = isValid;
      }
    });
  }

  String? validatePasswordMatch(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is required.';
    } else if (password != confirmPassword) {
      return 'Passwords do not match.';
    }
    return null; // Passwords match
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TakePhoto()),
          );

          context.read<UserCubit>().signUpNationalIdController.clear();
          context.read<UserCubit>().signUpPasswordController.clear();
          confirmPasswordController.clear();
          context
              .read<UserCubit>()
              .idUploadButtonKey
              .currentState
              ?.clearFileSelection();
          context
              .read<UserCubit>()
              .personalUploadButtonKey
              .currentState
              ?.clearFileSelection();
        } else if (state is SignUpFaliur) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Form(
            key: context.read<UserCubit>().signUpFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "National ID",
                  controller:
                      context.read<UserCubit>().signUpNationalIdController,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadImgsButton(
                  key: context.read<UserCubit>().idUploadButtonKey,
                  hintText: "Upload ID",
                  selectedFile: context.read<UserCubit>().idImage,
                  onFileSelected: handleIdImgUpload,
                  onValidationChanged: validateForm,
                ),
                const SizedBox(
                  height: 10,
                ),
                UploadImgsButton(
                  key: context.read<UserCubit>().personalUploadButtonKey,
                  hintText: "Upload a Personal Photo",
                  selectedFile: context.read<UserCubit>().personalImage,
                  onFileSelected: handlePersonalImgUpload,
                  onValidationChanged: validateForm,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomPassowrdText(
                  hintText: S.of(context).password,
                  controller:
                      context.read<UserCubit>().signUpPasswordController,
                  validator: (value) {
                    if (context
                        .read<UserCubit>()
                        .signUpPasswordController
                        .text
                        .isEmpty) {
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
                    validator: (value) => validatePasswordMatch(
                        context.read<UserCubit>().signUpPasswordController.text,
                        value!)),
                const SizedBox(
                  height: 70,
                ),
                state is SignUpLoading
                    ? const CircularProgressIndicator()
                    : Button(
                        text: 'Take Realtime photo',
                        color: AppColors.mainColor,
                        fontsize: 16,
                        width: 310,
                        height: 45,
                        onPressed: () {
                          context.read<UserCubit>().signUp(context);
                        },
                        textcolor: Colors.white,
                      )
              ],
            ));
      },
    );
  }
}

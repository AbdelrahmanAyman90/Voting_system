import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/presntion%20layer/Api/core/api/api_consumer.dart';
import 'package:voting/presntion%20layer/Api/core/api/end_points.dart';
import 'package:voting/presntion%20layer/Api/core/errors/exeptions.dart';
import 'package:voting/presntion%20layer/Api/functions/upload_images.dart';
import 'package:voting/presntion%20layer/Api/models/change_password_model.dart';
import 'package:voting/presntion%20layer/Api/models/sign_in_model.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/custom_widget/upload_imgs_button.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());

  final ApiConsumer api;
  GlobalKey<FormState> signInpFormKey = GlobalKey();
  TextEditingController signInNationalIdController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  PlatformFile? idImage;
  PlatformFile? personalImage;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController signUpNationalIdController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  GlobalKey<UploadIdButtonState> idUploadButtonKey =
      GlobalKey<UploadIdButtonState>();
  GlobalKey<UploadIdButtonState> personalUploadButtonKey =
      GlobalKey<UploadIdButtonState>();

  GlobalKey<FormState> changePasswordFormKey = GlobalKey();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  bool isFormValid = false;

  SignInModel? user;

  signUp(BuildContext context) async {
    try {
      if (signUpFormKey.currentState!.validate() && isFormValid) {
        emit(SignUpLoading());
        final response =
            await api.post(EndPoints.signUp, isFromData: true, data: {
          ApiKeys.nationalId: signUpNationalIdController.text,
          ApiKeys.images: await uploadIDImage(idImage!),
          ApiKeys.images: await uploadPersonalImage(personalImage!),
          ApiKeys.password: signUpPasswordController.text,
        });
        emit(SignUpSuccess());
      } else if (isFormValid == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please upload the required Photos',
              style: TextStyle(color: Colors.red),
            ),
            backgroundColor: Colors.white,
          ),
        );
      }
    } on ServerExeptions catch (e) {
      emit(SignUpFaliur(errorMessage: e.errorModel.errorMessage));
    }
  }

  signIn() async {
    try {
      if (signInpFormKey.currentState!.validate()) {
        emit(SignInLoading());
        final response = await api.post(EndPoints.signIn, data: {
          ApiKeys.nationalId: signInNationalIdController.text,
          ApiKeys.password: signInPasswordController.text,
        });

        user = SignInModel.fromJson(response);
        log(user!.data!.token!);
        final decoderToken = JwtDecoder.decode(user!.data!.token!);
        log(decoderToken['id']);
        CashNetwork.InsertToCash(key: ApiKeys.token, value: user!.data!.token!);
        CashNetwork.InsertToCash(
            key: ApiKeys.id, value: decoderToken[ApiKeys.id]);
        emit(SignInSuccess());
        getUser(user);
      }
    } on ServerExeptions catch (e) {
      emit(SignInFaliur(errorMessage: e.errorModel.errorMessage));
    }
  }

  changePassword() async {
    try {
      if (changePasswordFormKey.currentState!.validate()) {
        emit(ChangePasswordLoading());
        final response = await api.patch(
          EndPoints.changePassword,
          data: {
            "password": oldPasswordController.text,
            "newPassword": newPasswordController.text,
          },
          options: Options(headers: {
            'Authorization':
                'Bearer ${CashNetwork.GetFromCash(key: ApiKeys.token)}'
          }),
        );
        final changePasswordModel = ChangePasswordModel.fromJson(response);
        emit(ChangePasswordSuccess(message: changePasswordModel.message));
        getUser(user);
      }
    } on ServerExeptions catch (e) {
      emit(ChangePasswordFaliur(errorMessagee: e.errorModel.errorMessage));
    }
  }

  void getUser(SignInModel? user) {
    if (user != null) {
      emit(GetUserDataSuccess(user: user));
    }
  }

  logOut() async {
    CashNetwork.DeletFromCach(key: ApiKeys.token);
    CashNetwork.DeletFromCach(key: ApiKeys.id);
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/data/models/user_model/user_model.dart';
import 'package:voting/data/repository/user_authorization/user_repo_implement.dart';

part 'user_authorization_state.dart';

class UserAuthorizationCubit extends Cubit<UserAuthorizationState> {
  UserAuthorizationCubit(this.userRepoRegister)
      : super(UserAuthorizationInitial());
  UserAuthorizationepoImplemntion userRepoRegister;

  //
  userRegister(
      {required String nationalId,
      required String password,
      required PlatformFile nationalIdImage,
      required PlatformFile personalImage}) async {
    emit(UserAuthorizationRegisterLooding());
    try {
      var result = await userRepoRegister.registerUser(
          natinalIdImage: nationalIdImage,
          personalImage: personalImage,
          nationalId: nationalId,
          password: password);
      result.fold((l) {
        emit(UserAuthorizationRegisterFail(l.errorMassage));
      }, (r) async {
        await setUserData(r, password);
        emit(UserAuthorizationRegisterSucsses());
      });
    } on Exception catch (e) {
      emit(UserAuthorizationRegisterFail(e.toString()));
    }
  }

  setUserData(UserModel r, password) async {
    CashNetwork.InsertToCash(key: 'token', value: r.data!.token);
    CashNetwork.InsertToCash(key: 'idUser', value: r.data!.user!.sId!);
    CashNetwork.InsertToCash(key: 'name', value: r.data!.user!.name!);
    CashNetwork.InsertToCash(
        key: 'national_id', value: r.data!.user!.nationalId!);
    CashNetwork.InsertToCash(key: 'address', value: r.data!.user!.address!);
    token = r.data!.token;
    idUser = r.data!.user!.sId;
    userName = r.data!.user!.name!;
    userAddress = r.data!.user!.address!;
    userNationalId = r.data!.user!.nationalId!;
  }

  userLogin({
    required String nationalId,
    required String password,
  }) async {
    emit(UserAuthorizationRegisterLooding());
    try {
      var result = await userRepoRegister.loginUser(
          nationalId: nationalId, password: password);
      result.fold((l) {
        emit(UserAuthorizationRegisterFail(l.errorMassage));
      }, (r) async {
        await setUserData(r, password);

        emit(UserAuthorizationRegisterSucsses());
      });
    } on Exception catch (e) {
      emit(UserAuthorizationRegisterFail(e.toString()));
    }
  }

  logout() {
    CashNetwork.clearData();
  }

  userChangePassword(
      {required String newpassword, required String oldpassword}) async {
    emit(UserChangePasswordLooding());

    try {
      var result = await userRepoRegister.changePassword(
          newPassword: newpassword, oldPassword: oldpassword);
      result.fold((l) {
        emit(UserChangePasswordFail(l.errorMassage));
      }, (r) async {
        emit(UseChangePasswordSucsses());
      });
    } on Exception catch (e) {
      emit(UserChangePasswordFail(e.toString()));
    }
  }

  @override
  void onChange(Change<UserAuthorizationState> change) {
    print(change);
    super.onChange(change);
  }
}

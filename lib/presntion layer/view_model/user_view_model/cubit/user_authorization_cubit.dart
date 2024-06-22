import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:voting/data/models/user_model/user_model.dart';
import 'package:voting/data/repository/user_authorization/user_repo_implement.dart';

part 'user_authorization_state.dart';

class UserAuthorizationCubit extends Cubit<UserAuthorizationState> {
  UserAuthorizationCubit(this.userRepoRegister)
      : super(UserAuthorizationInitial());
  UserAuthorizationepoImplemntion userRepoRegister;
  UserModel? userData;
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
      }, (r) {
        setUserData(r);
        emit(UserAuthorizationRegisterSucsses());
      });
    } on Exception catch (e) {
      emit(UserAuthorizationRegisterFail(e.toString()));
    }
  }

  setUserData(UserModel data) {
    userData = data;
  }

  @override
  void onChange(Change<UserAuthorizationState> change) {
    print(change);
    super.onChange(change);
  }
}

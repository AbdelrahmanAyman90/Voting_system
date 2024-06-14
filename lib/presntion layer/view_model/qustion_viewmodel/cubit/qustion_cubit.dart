import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/data/models/qustion_model/qustion_model.dart';
import 'package:voting/data/repository/qustion/qustion_repo_implment.dart';

part 'qustion_state.dart';

class QustionCubit extends Cubit<QustionState> {
  QustionCubit(this.qustionRepo) : super(QustionInitial());
  QustionRepoImplemntion qustionRepo;
  List<QustionModel> qustionList = [];
//do requst and return data
  fetchQustion() async {
    emit(QustionLooding());

    try {
      var result = await qustionRepo.fetchQustion();
      result.fold(
        (l) {
          emit(QustionFail(l.errorMassage));
        },
        (r) {
          getListQustion(r);
          emit(QustionSuccess());
        },
      );
    } on Exception catch (e) {
      emit(QustionFail(e.toString()));
    }
  }

//function to store list that return from api(fetchqustion)
  getListQustion(List<QustionModel> qustionListenterfun) {
    qustionList.clear();
    qustionList.addAll(qustionListenterfun);
  }

  @override
  void onChange(Change<QustionState> change) {
    // TODO: implement onChange
    print(change);
  }
}

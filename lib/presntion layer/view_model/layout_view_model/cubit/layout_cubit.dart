import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  String? currentLanguage;
  void changeLanguage(String languagestate) {
    emit(LayoutLooding());
    log(languagestate);
    if (languagestate == "initial") {
      if (CashNetwork.GetFromCash(key: "lang") == 'en') {
        currentLanguage = languagestate;
        emit(ArbicState());
      } else {
        currentLanguage = languagestate;

        emit(EnglishState());
      }
    } else if (languagestate == 'ar') {
      CashNetwork.InsertToCash(key: 'lang', value: 'ar');
      currentLanguage = languagestate;

      emit(ArbicState());
    } else if (languagestate == 'en') {
      CashNetwork.InsertToCash(key: 'lang', value: 'en');
      currentLanguage = languagestate;

      emit(EnglishState());
    }
  }

  @override
  void onChange(Change<LayoutState> change) {
    // TODO: implement onChange
    print(change);
    super.onChange(change);
  }
}

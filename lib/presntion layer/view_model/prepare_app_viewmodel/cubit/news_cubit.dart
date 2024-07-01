import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/cash_helper.dart';
import 'package:voting/data/models/news_model/news_model.dart';
import 'package:voting/data/repository/preparapp/prepar_app_repo_implment.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.prepareApp) : super(NewsInitial());
  PreparAppRepoImplemnt prepareApp;
  fetchNews() async {
    emit(NewsLooding());
    try {
      var result = await prepareApp.fetchNews();
      result.fold((l) {
        emit(NewsFail(l.errorMassage));
      }, (r) {
        emit(NewsSuccess(r));
      });
    } on Exception catch (e) {
      emit(NewsFail(e.toString()));
    }
  }

  @override
  void onChange(Change<NewsState> change) {
    log(change.toString());

    super.onChange(change);
  }
}

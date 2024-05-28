import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voting/data/models/news_model/news_model.dart';
import 'package:voting/data/repository/news/news_repo_implment.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsRepo) : super(NewsInitial());
  NewsRepoImplemnt newsRepo;
  fetchNews() async {
    emit(NewsLooding());
    try {
      var result = await newsRepo.fetchNews();
      result.fold((l) {
        emit(NewsFail(l.errorMassage));
      }, (r) {
        emit(NewsSuccess(r));
      });
    } on Exception catch (e) {
      emit(NewsFail(e.toString()));
    }
  }
}

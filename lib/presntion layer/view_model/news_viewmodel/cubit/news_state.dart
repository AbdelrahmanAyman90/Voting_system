part of 'news_cubit.dart';

@immutable
sealed class PrepareAppState {}

final class NewsInitial extends PrepareAppState {}

final class NewsLooding extends PrepareAppState {}

final class NewsSuccess extends PrepareAppState {
  List<NewsModel> news;
  NewsSuccess(this.news);
}

final class NewsFail extends PrepareAppState {
  String errorMassage;
  NewsFail(this.errorMassage);
}

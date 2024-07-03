part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLooding extends NewsState {}

final class NewsSuccess extends NewsState {
  List<NewsModel> news;
  NewsSuccess(this.news);
}

final class NewsFail extends NewsState {
  String errorMassage;
  NewsFail(this.errorMassage);
}

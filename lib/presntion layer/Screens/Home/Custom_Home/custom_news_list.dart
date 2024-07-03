import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/shareWidget/stuts_app.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/Trending_news.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/news_container.dart';
import 'package:voting/presntion%20layer/view_model/news_viewmodel/cubit/news_cubit.dart';

class CustomNewsList extends StatelessWidget {
  const CustomNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return state is NewsSuccess
            ? ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: state.news.length, // Assuming state.news is a List
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => TrendingNews(
                              dataNews: state.news[index].createdAt!,
                              tittelNews: state.news[index].header!,
                              content: state.news[index].description!,
                              image: imagePath + state.news[index].image!),
                        ),
                      );
                    },
                    child: NewsContainer(
                      img: imagePath + state.news[index].image!,
                      title: state.news[index].header!,
                    ),
                  );
                },
              )
            : buildNewsShammer();
      },
    );
  }
}

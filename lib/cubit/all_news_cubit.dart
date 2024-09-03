import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Helpers/ApiHelper.dart';
import '../Models/news.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit() : super(AllNewsInitial());
  NewsModel newsModel = NewsModel();
  void getallNews(String Category) async {
    emit(AllLoading());
    try {
      String cat = Category.toLowerCase();
      final response = await DioHelper.getData(
        path: "https://newsapi.org/v2/top-headlines?country=de&category=$cat&apiKey=d0cd0e308b1e4ba7b418e75e88ab51a6",

      );
      newsModel = NewsModel.fromJson(response.data);
      if (newsModel.status == "ok") {
        emit(AllSuccess());
        print("+++++++++++++++++++++++++++++++"+response.data.toString());
        print(newsModel.articles.toString());
      } else {
        emit(AllError(newsModel.status.toString()));
      }
    } catch (e) {
      // print("errror"+ e.toString());
      emit(AllError(e.toString()));

    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Helpers/ApiHelper.dart';
import '../Models/news.dart';

part 'Trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingInitial());
  NewsModel newsModel2 = NewsModel();
  void getBreaking() async {
    emit(HomeTrendingLoading());
    try {
      final response = await DioHelper.getData(
        path: "https://newsapi.org/v2/everything?q=tesla&from=2024-09-02&sortBy=publishedAt&apiKey=d0cd0e308b1e4ba7b418e75e88ab51a6",
      );
      newsModel2 = NewsModel.fromJson(response.data);
      if (newsModel2.status == "ok") {
        emit(HomeTrendingSuccess());
      } else {
        emit(HomeTrindingError(newsModel2.status.toString()));
      }
    } catch (e) {
      // print("errror"+ e.toString());
      emit(HomeTrindingError(e.toString()));

    }
  }
}

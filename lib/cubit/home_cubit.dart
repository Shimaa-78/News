import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Helpers/ApiHelper.dart';
import '../Models/news.dart';

part 'home_state.dart';

class HomeCubet extends Cubit<HomeState> {
  HomeCubet() : super(HomeCubetInitial());


  NewsModel newsModel = NewsModel();


  void getBanners() async {
    emit(HomeBannerLoading());
    try {
      final response = await DioHelper.getData(
        path: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d0cd0e308b1e4ba7b418e75e88ab51a6",
      );
      newsModel = NewsModel.fromJson(response.data);
      if (newsModel.status == "ok") {
        emit(HomeBannerSuccess());
      } else {
        emit(HomeBannerError(newsModel.status.toString()));
      }
    } catch (e) {
      // print("errror"+ e.toString());
      emit(HomeBannerError(e.toString()));

    }
  }


}

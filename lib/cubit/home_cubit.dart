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
        path: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=453d4c5b4064475eb2565d9b2711195d",
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

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/network/dio_helper.dart';
import '../../../../core/network/end_points.dart';
import '../../Data/models/get_articles_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<bool> isSelectedNew = List.generate(5, (index) => false);
  GetArticlesModel? getArticlesModel;

  void changeBorderColorNew(int index) {
    for (int buttonIndex = 0;
        buttonIndex < isSelectedNew.length;
        buttonIndex++) {
      // debugPrint(buttonIndex.toString());
      if (buttonIndex == index) {
        isSelectedNew[buttonIndex] = !isSelectedNew[buttonIndex];
        emit(ChangeBorderColorSelected());
      } else {
        isSelectedNew[buttonIndex] = false;
        emit(ChangeBorderColorUnselected());
      }
    }
  }

  void getAllArticles() {
    emit(GetArticlesLoadingState());
    DioHelper.getData(
      endpoint: topHeadLineEndPoint,
    ).then((value) {
      // debugPrint(value.data.toString());
      if (value.statusCode! == 200) {
        getArticlesModel = null;
        getArticlesModel = GetArticlesModel.fromJson(value.data);
        getArticlesModel!.articlesList!.forEach((element) {
          // debugPrint(element.urlToImage);
        });
        if (getArticlesModel!.status == 'ok') {
          debugPrint(getArticlesModel!.totalResults.toString());

          emit(GetArticlesSuccessState());
        } else {
          emit(GetArticlesErrorState());
        }
        // debugPrint(getArticlesModel!.articlesList!.length.toString());
      } else {
        emit(GetArticlesErrorState());
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void getArticlesByCategory({required String category}) {
    emit(GetArticlesByCategoriesLoadingState());
    DioHelper.getData(
      endpoint: topHeadLineEndPointWithCategory(category),
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.statusCode! == 200) {
        getArticlesModel = null;
        getArticlesModel = GetArticlesModel.fromJson(value.data);
        debugPrint(getArticlesModel!.totalResults.toString());
        getArticlesModel!.articlesList!.forEach((element) {
          // debugPrint(element.urlToImage);
        });
        if (getArticlesModel!.status == 'ok') {
          debugPrint(getArticlesModel!.totalResults.toString());
          emit(GetArticlesByCategoriesSuccessState());
        } else {
          emit(GetArticlesByCategoriesErrorState());
        }
        // debugPrint(getArticlesModel!.articlesList!.length.toString());
      } else {
        emit(GetArticlesByCategoriesErrorState());
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}

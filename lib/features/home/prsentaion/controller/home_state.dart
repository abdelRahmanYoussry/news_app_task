part of 'home_cubit.dart';

// @immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetArticlesLoadingState extends HomeState {}

class GetArticlesSuccessState extends HomeState {}

class GetArticlesErrorState extends HomeState {}

class GetArticlesByCategoriesLoadingState extends HomeState {}

class GetArticlesByCategoriesSuccessState extends HomeState {}

class GetArticlesByCategoriesErrorState extends HomeState {}

//
// class PickUpImageLoadingState extends HomeState {}
//
// class PickUpImageSuccessState extends HomeState {}
//
// class PickUpImageErrorState extends HomeState {}
//
// class GetImagesLoadingState extends HomeState {}
//
// class GetImagesSuccessState extends HomeState {}

// class GetImagesErrorState extends HomeState {}

class ChangeBorderColorSelected extends HomeState {}

class ChangeBorderColorUnselected extends HomeState {}

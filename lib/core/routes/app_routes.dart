import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_task/features/home/Data/models/article_model.dart';
import 'package:new_app_task/features/home/prsentaion/screen/article_details_screen.dart';
import 'package:new_app_task/features/home/prsentaion/screen/article_web_view.dart';

import '../../features/home/prsentaion/controller/home_cubit.dart';
import '../../features/home/prsentaion/screen/home_screen.dart';
import '../services_locator/services_locator.dart';
import '../shared/mangers/color_manager.dart';
import '../shared/mangers/styles_manager.dart';

class Routes {
  static const String articleDetails = '/articleDetailsScreen';
  static const String homeScreen = '/homeScreen';
  static const String articleWebView = '/articleWebView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => serviceLocator<HomeCubit>()
                    ..getAllArticles()
                    ..changeBorderColorNew(0),
                  child: HomeScreen(),
                ),
            settings: settings);
      case Routes.articleDetails:
        return MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(
                articleModel: settings.arguments as ArticleModel),
            settings: settings);
      case Routes.articleWebView:
        return MaterialPageRoute(
            builder: (context) =>
                ArticleWebViewNew(initialUrl: settings.arguments as String),
            settings: settings);
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: ColorManager.mainPrimaryColor4,
        appBar: AppBar(
          backgroundColor: ColorManager.mainPrimaryColor4,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'LocaleKeys.appName.tr()',
          ),
        ),
        body: Center(
          child: Text(
            'No Route',
            style: getBoldBlack24Style(
// color: ColorManager.white,
// fontSize: FontSize.size18,
                ),
          ),
        ),
      ),
    );
  }
}

import 'package:new_app_task/core/network/base_model.dart';

import 'article_model.dart';

class GetArticlesModel extends BaseModel {
  List<ArticleModel>? articlesList;
  GetArticlesModel(
      {required super.data,
      required super.totalResults,
      required super.status,
      this.articlesList
      // this.content,
      });

  factory GetArticlesModel.fromJson(Map<String, dynamic> json) {
    return GetArticlesModel(
        articlesList: json['articles'] != null
            ? (json['articles'] as List)
                .map((e) => ArticleModel.fromJson(e))
                .toList()
            : null,
        totalResults: json['totalResults'],
        status: json['status'],
        data: json['status']);
  }
//
}

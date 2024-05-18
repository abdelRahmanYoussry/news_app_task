import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app_task/core/routes/app_routes.dart';
import 'package:new_app_task/core/shared/mangers/color_manager.dart';
import 'package:new_app_task/core/shared/mangers/extensions.dart';
import 'package:new_app_task/core/shared/widgets/cached_network_image.dart';
import 'package:new_app_task/core/shared/widgets/elevatedButton.dart';
import 'package:new_app_task/core/shared/widgets/spacing.dart';
import 'package:new_app_task/core/style/styles_manager.dart';
import 'package:new_app_task/features/home/Data/models/article_model.dart';

import '../controller/home_cubit.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({
    required this.articleModel,
    super.key,
  });

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    final articleModel2 =
        ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "News",
              style: getBoldWhite18Style(),
            ),
            centerTitle: true,
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: ColorManager.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300.h,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: MyCachedNetworkImage(
                      url: articleModel2.urlToImage,
                      boxFit: BoxFit.fill,
                      width: double.infinity,
                      height: 300.h,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title: ${articleModel2.title}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: getMediumBlack18Style(),
                        ),
                        verticalSpace(10),
                        Text(
                          'author: ${articleModel2.author ?? 'NA'}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getMediumBlack18Style(),
                        ),
                        verticalSpace(10),
                        Text(
                          'source: ${articleModel2.source!.name ?? 'NA'}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getMediumBlack18Style(),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  MyElevatedButton(
                      onTap: () {
                        context.pushNamed(Routes.articleWebView,
                            arguments: articleModel2.url);
                      },
                      buttonName: 'article\'s website',
                      buttonColor: ColorManager.mainBlue)
                ]),
          ),
        );
      },
    );
  }
}

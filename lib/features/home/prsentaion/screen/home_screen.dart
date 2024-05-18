import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app_task/core/shared/mangers/color_manager.dart';
import 'package:new_app_task/core/shared/mangers/extensions.dart';
import 'package:new_app_task/core/style/styles_manager.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/shared/widgets/cached_network_image.dart';
import '../../../../core/shared/widgets/filter_button_with_radius.dart';
import '../controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });
  List<String> categoriesButtonNameList = [
    'All',
    'Business',
    'Health',
    'Science',
    'Technology'
  ];
  @override
  Widget build(BuildContext context) {
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
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                    // color: Colors.black,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoriesButtonNameList.length,
                      itemBuilder: (context, index) => FilterButtonWithRadius(
                        buttonName: categoriesButtonNameList[index],
                        onTap: () {
                          if (categoriesButtonNameList[index] != 'All') {
                            context.read<HomeCubit>().getArticlesByCategory(
                                category:
                                    'category=${categoriesButtonNameList[index]}&');
                          } else {
                            context.read<HomeCubit>().getAllArticles();
                          }

                          context.read<HomeCubit>().changeBorderColorNew(index);
                        },
                        onCancleTap: () {
                          context.read<HomeCubit>().getAllArticles();
                          context.read<HomeCubit>().changeBorderColorNew(index);
                        },
                        isClicked:
                            context.read<HomeCubit>().isSelectedNew[index],
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                    builder: (context) => Expanded(
                      flex: 3,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: context
                              .read<HomeCubit>()
                              .getArticlesModel!
                              .articlesList!
                              .length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  context.pushNamed(Routes.articleDetails,
                                      arguments: context
                                          .read<HomeCubit>()
                                          .getArticlesModel!
                                          .articlesList![index]);
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      // color: ColorManager.blueColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(
                                          color: ColorManager.mainBlue)),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        width: 100,
                                        height: 100,
                                        child: MyCachedNetworkImage(
                                          url: context
                                              .read<HomeCubit>()
                                              .getArticlesModel!
                                              .articlesList![index]
                                              .urlToImage,
                                          width: 100.w,
                                          height: 100.h,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 220.w,
                                              child: Text(
                                                'Title: ${context.read<HomeCubit>().getArticlesModel!.articlesList![index].title}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 220.w,
                                              child: Text(
                                                'author: ${context.read<HomeCubit>().getArticlesModel!.articlesList![index].author ?? 'NA'}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 220.w,
                                              child: Text(
                                                'source: ${context.read<HomeCubit>().getArticlesModel!.articlesList![index].source!.name ?? 'NA'}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                    ),
                    condition:
                        context.read<HomeCubit>().getArticlesModel != null,
                    fallback: (context) => Center(
                        child: CircularProgressIndicator(
                      color: ColorManager.blueColor,
                    )),
                  )
                ]),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_task/features/home/prsentaion/controller/home_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/shared/mangers/color_manager.dart';
import '../../../../core/shared/mangers/styles_manager.dart';

class ArticleWebViewNew extends StatefulWidget {
  final String initialUrl;

  const ArticleWebViewNew({
    super.key,
    required this.initialUrl,
  });

  @override
  ArticleWebViewState createState() => ArticleWebViewState();
}

class ArticleWebViewState extends State<ArticleWebViewNew> {
  late final WebViewController controller;

  @override
  void initState() {
    // final url = ModalRoute.of(context)!.settings.arguments as String;
    super.initState();
    debugPrint(widget.initialUrl);
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.initialUrl),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Web View',
              style: getBoldWhite18Style(),
            ),
            centerTitle: true,
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
          body: WebViewWidget(
            controller: controller,
          ),
        );
      },
    );
  }
}

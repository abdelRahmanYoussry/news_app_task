import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app_task/core/services_locator/services_locator.dart' as di;

import 'core/routes/app_routes.dart';
import 'core/shared/app/NavigationService.dart';
import 'core/shared/mangers/color_manager.dart';
import 'features/home/prsentaion/controller/home_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await ScreenUtil.ensureScreenSize();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => HomeCubit())],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (context, child) => MaterialApp(
            title: 'News App',
            navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (route) => RouteGenerator.getRoute(route),
            initialRoute: Routes.homeScreen,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Colors.blue,
                scaffoldBackgroundColor: ColorManager.white,
                useMaterial3: true,
                appBarTheme: AppBarTheme(color: ColorManager.blueColor)),
          ),
        ));
  }
}

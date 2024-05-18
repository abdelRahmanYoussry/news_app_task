import 'package:flutter/material.dart';

import '../../style/NavigationService.dart';
import '../mangers/color_manager.dart';

void navigateTo(context, {required routeName}) =>
    Navigator.pushNamed(context, routeName);

void navigateAndFinish(context, {required routeName}) =>
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);

void navigateAndFinishWithoutRoute(context, widget) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
void navigateToWithoutRoute(context, {required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;
    case ToastState.error:
      color = Colors.red;
      break;
    case ToastState.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

enum ToastState { success, error, warning }

Size myMediaQuery({
  required BuildContext context,
}) {
  return MediaQuery.of(context).size;
}

SnackBar mySnackBar({required String myMessage, required bool isError}) =>
    SnackBar(
      width:
          myMediaQuery(context: NavigationService.navigatorKey.currentContext!)
              .width,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(vertical: 10),
      // margin: const EdgeInsets.symmetric(vertical: AppPadding.padding10),
      content: Text(
        textAlign: TextAlign.center,
        myMessage,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor:
          isError ? ColorManager.error : ColorManager.mainPrimaryColor4,
    );

DateTime currentDateTime() {
  return DateTime.now();
}

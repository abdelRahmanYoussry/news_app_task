import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app_task/core/shared/mangers/color_manager.dart';

import 'custom_text.dart';
// import 'package:flutter_translate/flutter_translate.dart';

class FilterButtonWithRadius extends StatefulWidget {
  const FilterButtonWithRadius({
    super.key,
    required this.buttonName,
    required this.onTap,
    required this.onCancleTap,
    required this.isClicked,
  });
  final String buttonName;
  final Function()? onTap;
  final Function()? onCancleTap;
  final bool isClicked;
  @override
  State<FilterButtonWithRadius> createState() => _FilterButtonWithRadiusState();
}

class _FilterButtonWithRadiusState extends State<FilterButtonWithRadius> {
  // bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.buttonName);
    return InkWell(
      onTap: () {
        setState(() {
          // isClicked = !isClicked;
        });
        if (widget.isClicked == true) {
          widget.onCancleTap!();
        } else {
          widget.onTap!();
        }

        // setState(() {
        //   isClicked = !isClicked;
        //   if (isClicked == false) {
        //     widget.onCancleTap!();
        //   }
        // });
      },
      child: Container(
        decoration: BoxDecoration(
            color: widget.isClicked == false
                ? Colors.white
                : ColorManager.blueColor,
            borderRadius: BorderRadius.circular(
              5.r,
            ),
            border: Border.all(
              color: widget.isClicked == false
                  ? ColorManager.blueColor
                  : ColorManager.white,
            )),
        margin: const EdgeInsets.all(5),
        child: SizedBox(
          // height: 50.h,
          width: 80.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Center(
              child: CustomText(
                text: widget.buttonName,
                color: widget.isClicked ? Colors.white : ColorManager.blueColor,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

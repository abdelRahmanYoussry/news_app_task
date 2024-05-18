import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final bool? alignCenter;
  final bool? ellipsis;
  final int? maxLines;

  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textDecoration,
    this.maxLines,
    this.ellipsis = false,
    this.alignCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        decoration: textDecoration ?? TextDecoration.none,
        color: color,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
      overflow: ellipsis == true ? TextOverflow.ellipsis : null,
      textAlign: alignCenter == true ? TextAlign.center : null,
    );
  }
}

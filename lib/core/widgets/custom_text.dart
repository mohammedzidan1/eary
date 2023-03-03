import 'package:eary/core/utilites/font_manager.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final String? fontFamily;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const CustomText(
      {Key? key,
        this.text,
        this.fontFamily,
        this.color,
        this.fontSize,
        this.fontWeight
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: TextOverflow.clip,
      style: TextStyle(
          color: color!,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
    );
  }
}

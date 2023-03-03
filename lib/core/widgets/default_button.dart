import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key, this.text, this.height, this.width, this.onPressed,this.fontSize,this.fontFamily,this.fontWeight})
      : super(key: key);
  final String? text;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? height;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        textColor: Colors.white,
        height: height,
        minWidth: width,
        color: const Color(0xff998BE0),
        onPressed: () {
          onPressed!();
        },
        child: Text(
          text!,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
          ),
        ));
  }
}

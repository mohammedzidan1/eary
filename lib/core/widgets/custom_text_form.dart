import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilites/values_manager.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final double? hintSize;
  final double? width;
  final double? radius;
  final double? height;
  final EdgeInsets? padding;
  final Color? color;
  final IconData? suffixIcon;
  final TextEditingController? controller;

  final Function? onChanged;

  const CustomTextField({
    Key? key,
    this.suffixIcon,
    this.radius,
  this.hintSize,
    this.padding ,
    this.hintText,
    this.onChanged,
    this.controller,
    this.color,
    this.width = double.infinity,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(left: 8.6,top: 8),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: TextFormField(

        onChanged: (value) {
          onChanged!(value);
        },
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIconConstraints: const BoxConstraints(maxWidth: AppSize.s16),
          suffixIcon: Icon(suffixIcon),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: hintSize!.sp, color:const Color (0xff525252)),
        ),
      ),
    );
  }
}

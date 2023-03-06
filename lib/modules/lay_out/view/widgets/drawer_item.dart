import 'package:eary/core/utilites/font_manager.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItem extends StatelessWidget {
  final String? image, text;
  final double? imageHeight, imageWidth;
  final Function? onTap;

  const DrawerItem(
      {Key? key,
      this.image,
      this.text,
      this.imageHeight,
      this.imageWidth,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!()!;
      },
      child: ListTile(
        leading: Image.asset(
          image!,
          height: imageHeight,
          width: imageWidth,
        ),
        title: CustomText(
          text: text,
          color: Colors.black,
          fontSize: 18.sp,
          fontFamily: AppFontFamily.inconsolata,
        ),
      ),
    );
  }
}

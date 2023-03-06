import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilites/font_manager.dart';
import '../../../../core/widgets/custom_text.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({Key? key, this.onTap, this.image, this.title})
      : super(key: key);
  final String? title, image;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!()!;
      },
      child: ListTile(
        leading: Image.asset(
          image!,
          height: 30,
          width: 25,
        ),
        title: CustomText(
          text: title,
          color: Colors.black,
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          fontFamily: AppFontFamily.inconsolata,
        ),
        trailing:const Icon(Icons.arrow_back_ios_new_outlined)
      ),
    );
  }
}

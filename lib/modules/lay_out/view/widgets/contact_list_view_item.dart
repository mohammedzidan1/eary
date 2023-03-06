import 'package:eary/modules/authontication/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilites/font_manager.dart';
import '../../../../core/widgets/custom_text.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key, this.model}) : super(key: key);
  final UserModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 13.5.h, left: 31.w, right: 27.h),
      padding: const EdgeInsets.all(8),
      width: 344.w,
      height: 64.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: const Color(0xffCED1EE).withOpacity(.65)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.yellow,
          radius: 20.r,
          child: CustomText(
            text: "e",
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            fontFamily: AppFontFamily.inter,
          ),
        ),
        title: CustomText(
          text: model!.userName!,
          color: const Color(0xff525252),
          fontSize: 16.sp,
          fontFamily: AppFontFamily.inter,
        ),
      ),
    );
  }
}

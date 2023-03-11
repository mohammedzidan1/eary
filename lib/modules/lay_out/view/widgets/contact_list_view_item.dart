import 'package:eary/modules/authontication/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilites/font_manager.dart';
import '../../../../core/widgets/custom_text.dart';

class ContactItem extends StatelessWidget {
  ContactItem({Key? key, this.user}) : super(key: key);
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    Color color = (colors..shuffle()).last;
    return Container(
      margin: EdgeInsets.only(top: 13.5.h, left: 12.w, right: 27.h),
      padding: const EdgeInsets.all(8),
      width: 344.w,
      height: 64.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: const Color(0xffCED1EE).withOpacity(.65)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          radius: 20.r,
          child: CustomText(
            text: user?.userName?[0],
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            fontFamily: AppFontFamily.inter,
          ),
        ),
        title: CustomText(
          text: user!.userName!,
          color: const Color(0xff525252),
          fontSize: 16.sp,
          fontFamily: AppFontFamily.inter,
        ),
      ),
    );
  }

  final List<Color> colors = [
    Colors.blue,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.deepPurpleAccent,
    Colors.deepOrange,
    Colors.lightBlue
  ];
}

import 'package:eary/core/config/localization/languages/appStrings_strings.dart';
import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/core/utilites/font_manager.dart';
import 'package:eary/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_routes/routes_mames.dart';
import '../../../../core/widgets/custom_text.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F9FF),
      body: Container(
        margin: EdgeInsets.only(top: 90.0.h),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              height: 148.h,
              width: 148.w,
            ),
            CustomText(
              text: AppStrings.eary,
              fontSize: 32.sp,
              fontFamily: AppFontFamily.fingerPaintFamily,
              fontWeight: FontWeight.w400,
              color: const Color(0xff998BE0),
            ),
            CustomText(
              text: AppStrings.noCommunicationBarrierAnymore,
              color: Color(0xff525252C2),
              textAlign: TextAlign.center,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 35.h,
            ),
            DefaultButton(
              height: 44.h,
              width: 307.w,
              text:AppStrings.register,
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              fontFamily: AppFontFamily.poppinsFamily,
              backGroundcolor: const Color(0xff998BE0),
              onPressed: () {
                Navigator.pushNamed(context, RoutsNames.register);
              },
            ),
             SizedBox(
              height: 20.h,
            ),
            DefaultButton(
              height: 44.h,
              width: 307.w,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              fontFamily: AppFontFamily.poppinsFamily,
              color: const Color(0xff998CDE),
              backGroundcolor: const Color(0xffffffff),
              text:AppStrings.login,
              onPressed: () {
                Navigator.pushNamed(context, RoutsNames.login);
              },
            )
          ],
        ),
      ),
    );
  }
}

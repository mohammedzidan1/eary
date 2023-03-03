import 'package:eary/core/utilites/font_manager.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_routes/routes_mames.dart';
import '../../../../core/widgets/custom_text_form.dart';
import '../../../../core/widgets/default_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F9FF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 69.h),
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: "Hello Again!",
                fontSize: 32.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff525252),
              ),
              SizedBox(
                height: 17.h,
              ),
              CustomText(
                text: "Welcome back you’ve been missed",
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff525252),
              ),
              SizedBox(
                height: 19.h,
              ),

              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                width: 320.w,
                height: 49.h,
                hintText: "Username",
                hintSize: 16.sp,
                color: Colors.white,
              ),

              SizedBox(
                height: 15.h,
              ),
              CustomTextField(
                width: 320.w,
                height: 49.h,
                hintText: "Password",
                suffixIcon: Icons.visibility,
                hintSize: 16.sp,
                color: Colors.white,
              ),
              SizedBox(
                height: 15.h,
              ),

              SizedBox(
                height: 33.h,
              ),
              DefaultButton(
                height: 44.h,
                width: 316.w,
                text: "Login",
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                fontFamily: AppFontFamily.poppinsFamily,
                onPressed: () {
                  Navigator.pushNamed(context, RoutsNames.home);
                },
              ),
              SizedBox(
                height: 27.h,
              ),
              CustomText(
                text: "or continue with",
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                fontFamily: AppFontFamily.poppinsFamily,
                color: const Color(0xff525252),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Image.asset(
                      'assets/images/google.png',
                      height: 38.h,
                      width: 40.0.w,
                    ),
                  ),
                  const   SizedBox(
                    width: 36,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Image.asset(
                      'assets/images/facebook.png',
                      width: 47.w,
                      height: 43.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

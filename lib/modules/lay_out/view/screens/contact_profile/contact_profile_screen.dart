import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/core/widgets/custom_appBar.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactProfileScreen extends StatelessWidget {
  ContactProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 69),
                  width: 414.w,
                  height: 161.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37.0),
                      color: const Color(0xffF0F9FF)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: CustomText(
                          text: "Alaa Osama",
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                           Image.asset(AppImages.contact1,height: 28.0.h,width: 35.0.w,),
                           Image.asset(AppImages.contact2,height: 28.0.h,width: 35.0.w,),
                           Image.asset(AppImages.contact3,height: 28.0.h,width: 35.0.w,),
                           Image.asset(AppImages.contact4,height: 28.0.h,width: 35.0.w,),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 13.0, left: 157),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(AppImages.userImage),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

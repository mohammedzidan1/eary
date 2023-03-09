import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/core/utilites/font_manager.dart';
import 'package:eary/core/widgets/custom_appBar.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactProfileScreen extends StatelessWidget {
  const ContactProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              customContainer(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: CustomText(
                          text: "Alaa Osama",
                          color: Color(0xff998BE0),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppFontFamily.inter,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              AppImages.contact1,
                              height: 28.0.h,
                              width: 35.0.w,
                            ),
                            Image.asset(
                              AppImages.contact2,
                              height: 28.0.h,
                              width: 35.0.w,
                            ),
                            Image.asset(
                              AppImages.contact3,
                              height: 28.0.h,
                              width: 35.0.w,
                            ),
                            Image.asset(
                              AppImages.contact4,
                              height: 28.0.h,
                              width: 35.0.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  margin: 69),
              const Padding(
                padding: EdgeInsets.only(top: 13.0, left: 157),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(AppImages.userImage),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 13, left: 29),
                    child: CustomText(
                      text: "27 December",
                      color: Color(0xff998BE0),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFontFamily.inter,
                    ),
                  ),
                  customContainer(
                    margin: 15,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset(
                            AppImages.outGoingCall,
                            height: 21.33,
                            width: 32,
                          ),
                          title: const CustomText(
                            text: "8:19 pm",
                            color: Color(0xff998BE0),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFontFamily.inter,
                          ),
                          subtitle: CustomText(
                            text: "Outgoing call,  20 mins 50 secs",
                            color: const Color(0xff998CDE).withOpacity(.7),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFontFamily.inter,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 9),
                          child: ListTile(
                            leading: Image.asset(
                              AppImages.missingCall,
                              height: 21.33,
                              width: 32,
                            ),
                            title: const CustomText(
                              text: "5:05 pm",
                              color: Color(0xff998BE0),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFontFamily.inter,
                            ),
                            subtitle: CustomText(
                              text: "Missed call",
                              color: const Color(0xff998CDE).withOpacity(.7),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFontFamily.inter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              itemCount: 7,
            ),
          )
        ],
      ),
    );
  }
}

Widget customContainer({Widget? child, double? margin}) {
  return Container(
    margin: EdgeInsets.only(top: margin!),
    width: 414.w,
    height: 161.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37.0),
        color: const Color(0xffF0F9FF)),
    child: child,
  );
}

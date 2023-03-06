import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:eary/on_boarding/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatelessWidget {
 final OnBoardingModel?onBoardingModel;
  const OnBoardingItem({Key? key,this.onBoardingModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 414,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0xffF0F9FF),
                borderRadius: BorderRadius.circular(30.0)),
            child: Image.asset(onBoardingModel!.image!),
          ),
          SizedBox(height: 25.h,),
          CustomText(text: onBoardingModel!.title!,fontSize: 24.sp,fontWeight: FontWeight.w700,color: Colors.black,),
          SizedBox(height: 8.h,),
          CustomText(text: onBoardingModel!.description!,fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.black54,),
        ],
      ),
    );
  }
}

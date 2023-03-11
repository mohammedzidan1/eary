import 'package:eary/core/app_routes/routes_mames.dart';
import 'package:eary/core/config/localization/languages/appStrings_strings.dart';
import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/on_boarding/model.dart';
import 'package:eary/on_boarding/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/widgets/default_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  List<OnBoardingModel> model = [
    OnBoardingModel(
        title: AppStrings.titleOnBoarding1,
        image: AppImages.onBoarding1,
        description: AppStrings.descriptionOnBoarding1),
    OnBoardingModel(
        title: AppStrings.titleOnBoarding2,
        image: AppImages.onBoarding2,
        description: AppStrings.descriptionOnBoarding2),
    OnBoardingModel(
        title: AppStrings.titleOnBoarding3,
        image: AppImages.onBoarding3,
        description: AppStrings.descriptionOnBoarding3),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 34.h,bottom: 32.0.h,right: 24.w,left: 21.w),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardingItem(
                    onBoardingModel: model[index],
                  ),
                  itemCount: 3,
                ),
              ),
              Row(
                children: [
                  ...List.generate(3, (index) => DotIndicator(isActive: index==_pageIndex,)),
                  const Spacer(),
                  DefaultButton(
                    backGroundcolor: const Color(0xffCED1EE),
                    height: 44.h,
                    width: 135.w,
                    text:_pageIndex==2 ?AppStrings.start:AppStrings.skip,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff998CDE),
                    onPressed: () {
                      _pageIndex==2 ? Navigator.pushNamed(context, RoutsNames.authentication):
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);

                    },
                  ),
                ],
              ),

              // onPressed: (){}, child: CustomText(text: "Skip",fontSize: 20.sp,fontWeight: FontWeight.w700,color: Color(0xff998CDE),))
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  bool isActive;

  DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0),
      child: AnimatedContainer(
        duration:const Duration(milliseconds: 300),


          height: isActive ? 13 : 13,
          width: 13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive?Color(0xff998BE0):Color(0xffCED1EE),
          ),

      ),
    );
  }
}

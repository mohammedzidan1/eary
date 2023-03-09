import 'package:eary/core/app_routes/routes_mames.dart';
import 'package:eary/core/config/localization/languages/appStrings_strings.dart';
import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/core/utilites/font_manager.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:eary/modules/authontication/view_model/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xffF0F9FF),
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fontSize: 32.sp,
                fontWeight: FontWeight.w400,
                fontFamily: AppFontFamily.fingerPaintFamily,
                text: AppStrings.eary,
                color: Color(0xff525252),
              ),
              SizedBox(
                height: 29.h,
              ),
              DrawerItem(
                text: AppStrings.yourProfile,
                image: AppImages.editProfile,
                imageHeight: 17,
                imageWidth: 17.86,
                onTap: () {
                  Navigator.pushNamed(context, RoutsNames.profile);
                },
              ),
              DrawerItem(
                  text: AppStrings.languages,
                  image: AppImages.languages,
                  imageHeight: 20,
                  imageWidth: 20,
                  onTap: () {}),
              DrawerItem(
                  text: AppStrings.theme,
                  image: AppImages.themes,
                  imageHeight: 18,
                  imageWidth: 18,
                  onTap: () {}),
              DrawerItem(
                  text: AppStrings.settings,
                  image: AppImages.settings,
                  imageHeight: 20,
                  imageWidth: 20,
                  onTap: () {
                    Navigator.pushNamed(context, RoutsNames.settings);
                  }),
              DrawerItem(
                  text: AppStrings.logOut,
                  image: AppImages.logOut,
                  imageHeight: 18,
                  imageWidth: 18,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: CustomText(
                            text: AppStrings.areYouSureLogout,
                            fontFamily: AppFontFamily.fingerPaintFamily,
                            fontSize: 20.h,
                            color: Colors.black,
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child:  Text(AppStrings.cancel),
                            ),
                            MaterialButton(
                              onPressed: () {
                                AuthBloc().logOut(context);
                              },
                              child:  Text(AppStrings.ok),
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

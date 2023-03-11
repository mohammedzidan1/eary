import 'package:eary/core/config/localization/languages/appStrings_strings.dart';
import 'package:eary/modules/authontication/model/user.dart';
import 'package:eary/modules/authontication/view_model/auth_bloc.dart';
import 'package:eary/modules/lay_out/view/widgets/edit_profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilites/app_images.dart';
import '../../../../../core/utilites/font_manager.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/default_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    AuthBloc().getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F9FF),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff998BE0),
          ),
        ),
      ),
      body: ModelStreamSingleBuilder<UserModel>(
        docId: FirebaseAuth.instance.currentUser?.uid,
        onLoading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        onSuccess: (user) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 38.h),
                child: Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: user?.imageUrl == null
                        ? Image.asset(
                            AppImages.userImage,
                            fit: BoxFit.fitWidth,
                          )
                        : Image.network(user!.imageUrl!, fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 21.91.h, left: 36.w),
                child: CustomText(
                  text: AppStrings.info,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppFontFamily.inter,
                  color: const Color(0xff998BE0),
                ),
              ),
              SizedBox(
                height: 21.91.h,
              ),
              containerBody(user),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: DefaultButton(
                  height: 44.h,
                  width: 316.w,
                  color: Colors.white,
                  backGroundcolor: const Color(0xff998BE0),
                  text: AppStrings.editProfile,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFontFamily.poppinsFamily,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      barrierColor: const Color(0xffF0F9FF),
                      backgroundColor: const Color(0xffE4EBF9),
                      elevation: 10,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(20.0),
                      // ),
                      builder: (BuildContext context) {
                        return EditProfileWidget(user: user);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget containerBody(UserModel? user) {
  return Container(
    margin: EdgeInsets.only(top: 13.5.h, left: 31.w, right: 27.h),
    padding: EdgeInsets.only(left: 18.h, top: 16.h),
    width: 324.w,
    height: 200.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        color: const Color(0xffE4EBF9)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: user?.userName ?? '',
          color: const Color(0xff525252),
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          fontFamily: AppFontFamily.inter,
        ),
        SizedBox(
          height: 11.12.h,
        ),
        const Divider(
          height: 1,
          color: Colors.white,
        ),
        SizedBox(
          height: 21.21.h,
        ),
        CustomText(
          text: user?.email,
          color: const Color(0xff525252),
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          fontFamily: AppFontFamily.inter,
        ),
        SizedBox(
          height: 11.12.h,
        ),
        const Divider(
          height: 1,
          color: Colors.white,
        ),
        SizedBox(
          height: 21.21.h,
        ),
        CustomText(
          text: "Female",
          color: const Color(0xff525252),
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          fontFamily: AppFontFamily.inter,
        ),
        SizedBox(
          height: 11.12.h,
        ),
        const Divider(
          height: 1,
          color: Colors.white,
        ),
        SizedBox(
          height: 21.21.h,
        ),
      ],
    ),
  );
}

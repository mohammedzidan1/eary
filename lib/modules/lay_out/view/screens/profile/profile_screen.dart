import 'package:eary/modules/authontication/model/user.dart';
import 'package:eary/modules/authontication/view_model/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utilites/app_images.dart';
import '../../../../../core/utilites/font_manager.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_form.dart';
import '../../../../../core/widgets/default_button.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ImagePicker picker = ImagePicker();
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
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 38.h),
                child: Center(
                  child: CircleAvatar(
                    radius: 60.r,
                    child: Image.asset(
                      AppImages.userImage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 21.91.h, left: 36.w),
                child: CustomText(
                  text: "Info",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppFontFamily.inter,
                  color: const Color(0xff998BE0),
                ),
              ),
              SizedBox(
                height: 21.91.h,
              ),
              containerBody(snapshot.data),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: DefaultButton(
                  height: 44.h,
                  width: 316.w,
                  color: Colors.white,
                  backGroundcolor: const Color(0xff998BE0),
                  text: "Edit Profile",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFontFamily.poppinsFamily,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      barrierColor: const Color(0xffF0F9FF),
                      backgroundColor: const Color(0xffE4EBF9),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                const CustomText(
                                  text: "Edit profile",
                                  color: Colors.black,
                                  fontFamily: AppFontFamily.fingerPaintFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    CircleAvatar(
                                      radius: 60.r,
                                      child: Image.asset(
                                        AppImages.userImage,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        XFile? image = await picker.pickImage(
                                            source: ImageSource.gallery);
                                      },
                                      child: CircleAvatar(
                                        radius: 25.r,
                                        child: Image.asset(
                                          AppImages.camera,
                                          height: 18.2.h,
                                          width: 20.w,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomTextField(
                                  // controller: _bloc.passwordController,
                                  width: 320.w,
                                  height: 49.h,
                                  radius: 10,
                                  hintText: " Change userName",

                                  hintSize: 16.sp,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextField(
                                  // controller: _bloc.passwordController,
                                  width: 320.w,
                                  height: 49.h,
                                  radius: 10,
                                  hintText: " Change Email",

                                  hintSize: 16.sp,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextField(
                                  // controller: _bloc.passwordController,
                                  width: 320.w,
                                  height: 49.h,
                                  radius: 10,
                                  hintText: " Change Password",
                                  suffixIcon: Icons.visibility,
                                  hintSize: 16.sp,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomTextField(
                                  // controller: _bloc.passwordController,
                                  width: 320.w,
                                  height: 49.h,
                                  radius: 10,
                                  hintText: " Change Gender",
                                  hintSize: 16.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DefaultButton(
                                  height: 44.h,
                                  width: 316.w,
                                  color: Colors.white,
                                  backGroundcolor: Color(0xff998BE0),
                                  text: "Save",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppFontFamily.poppinsFamily,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        );
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

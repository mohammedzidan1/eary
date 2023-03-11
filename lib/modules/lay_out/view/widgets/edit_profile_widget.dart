import 'dart:io';

import 'package:eary/core/config/localization/languages/appStrings_strings.dart';
import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/core/utilites/firebase_storage_util.dart';
import 'package:eary/core/utilites/font_manager.dart';
import 'package:eary/core/utilites/image_picker_util.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:eary/core/widgets/custom_text_form.dart';
import 'package:eary/core/widgets/default_button.dart';
import 'package:eary/core/widgets/keyboard_wrap.dart';
import 'package:eary/modules/authontication/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileWidget extends StatefulWidget {
  EditProfileWidget({Key? key, this.user}) : super(key: key);
  final UserModel? user;

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: widget.user?.email);
    final TextEditingController userNameController =
        TextEditingController(text: widget.user?.userName);
    return KeyboardWrap(
      child: Column(
        children: <Widget>[
          CustomText(
            text: AppStrings.editProfile,
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
              Container(
                height: 120,
                width: 120,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: imagePath == null
                    ? widget.user?.imageUrl == null
                        ? Image.asset(
                            AppImages.userImage,
                            fit: BoxFit.fitWidth,
                          )
                        : Image.network(widget.user!.imageUrl!,
                            fit: BoxFit.cover)
                    : Image.file(
                        File(
                          imagePath!,
                        ),
                        fit: BoxFit.cover),
              ),
              GestureDetector(
                onTap: () async {
                  await ImagePickerUtil.getImage();
                  setState(() {
                    imagePath = ImagePickerUtil.path;
                  });
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
            controller: userNameController,
            width: 320.w,
            height: 49.h,
            radius: 10,
            hintText: AppStrings.changeUserName,
            hintSize: 16.sp,
            color: Colors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextField(
            controller: emailController,
            width: 320.w,
            height: 49.h,
            radius: 10,
            hintText: AppStrings.changeEmail,
            hintSize: 16.sp,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          DefaultButton(
            height: 44.h,
            width: 316.w,
            color: Colors.white,
            backGroundcolor: const Color(0xff998BE0),
            text: AppStrings.save,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            fontFamily: AppFontFamily.poppinsFamily,
            onPressed: () async {
              widget.user?.update(data: {
                'user_name': userNameController.text,
                'email': emailController.text,
                'imageUrl': imagePath == null
                    ? widget.user?.imageUrl
                    : await FirebaseStorageUtil.uploadFile(imagePath!),
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

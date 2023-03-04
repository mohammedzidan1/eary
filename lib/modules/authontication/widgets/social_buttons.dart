import 'package:eary/modules/authontication/view_model/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            AuthBloc().signInWithGoogle(context);
          },
          child: Image.asset(
            'assets/images/google.png',
            height: 38.h,
            width: 40.0.w,
          ),
        ),
        const SizedBox(
          width: 36,
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/images/facebook.png',
            width: 47.w,
            height: 43.h,
          ),
        ),
      ],
    );
  }
}

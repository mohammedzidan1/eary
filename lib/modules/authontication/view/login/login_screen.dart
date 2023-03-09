import 'package:eary/core/config/localization/languages/appStrings_strings.dart';
import 'package:eary/core/utilites/font_manager.dart';
import 'package:eary/core/utilites/validator_util.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:eary/modules/authontication/view_model/auth_bloc.dart';
import 'package:eary/modules/authontication/view_model/auth_state.dart';
import 'package:eary/modules/authontication/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text_form.dart';
import '../../../../core/widgets/default_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthBloc _bloc = AuthBloc();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F9FF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 69.h),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: AppStrings.helloAgain,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff525252),
                ),
                SizedBox(
                  height: 17.h,
                ),
                CustomText(
                  text: AppStrings.welcomebackyouVebeenMissed,
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
                  controller: _bloc.emailController,
                  validator: ValidatorUtil.email,
                  width: 320.w,
                  radius: 10,
                  height: 49.h,
                  hintText: AppStrings.username,
                  hintSize: 16.sp,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField(
                  controller: _bloc.passwordController,
                  validator: ValidatorUtil.password,
                  width: 320.w,
                  height: 49.h,
                  radius: 10,
                  hintText: AppStrings.password,
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
                BlocBuilder<AuthBloc, AuthState>(
                  bloc: AuthBloc(),
                  builder: (context, state) {
                    if (state.isLoading == true) {
                      return const CircularProgressIndicator();
                    } else {
                      return DefaultButton(
                        height: 44.h,
                        width: 316.w,
                        color: Colors.white,
                        backGroundcolor: Color(0xff998BE0),
                        text: AppStrings.login,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFontFamily.poppinsFamily,
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _bloc.signIn(context);
                          }
                        },
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 27.h,
                ),
                CustomText(
                  text: AppStrings.orContinueWith,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFontFamily.poppinsFamily,
                  color: const Color(0xff525252),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

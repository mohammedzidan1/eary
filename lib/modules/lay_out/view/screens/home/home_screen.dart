import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/core/widgets/custom_text_form.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_routes/routes_mames.dart';
import '../../../../../core/utilites/font_manager.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../authontication/model/user.dart';
import '../../widgets/contact_list_view_item.dart';
import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? searchValue;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 53.h, left: 26.w, right: 27.h),
              height: 54.h,
              width: 390.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xffCED1EE)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 40.sp,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 1.6.w,
                  ),
                  CustomTextField(
                    // controller: .passwordController,
                    width: 251.5.w,
                    height: 33.h,
                    radius: 15.r,
                    hintText: "Search",
                    hintSize: 16.sp,

                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 6.88.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutsNames.profile);
                    },
                    child: CircleAvatar(
                      radius: 20.r,
                      child: Image.asset(AppImages.user),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22.5.h, left: 32.w, right: 27.h),
              child: CustomText(
                text: "Contacts",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                fontFamily: AppFontFamily.inter,
                color: const Color(0xff998BE0),
              ),
            ),
            Expanded(
              child: ModelGetBuilder<UserModel>(builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      List<UserModel?> user = snapshot.data!;
                      return ContactItem(
                        model: user[index],
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// body: ModelGetBuilder<UserModel>(builder: (context, snapshot) {
// return ListView.builder(
// itemCount: snapshot.data?.length,
// itemBuilder: (_, index) {
// UserModel? user = snapshot.data?[index];
// return Text(user?.userName ?? '');
// });
// }),

import 'package:eary/core/utilites/app_images.dart';
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
                  Expanded(
                    flex: 4,
                    child: IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 40.sp,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: 1.6.w,
                  ),
                  Expanded(
                    flex: 18,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            searchValue = val;
                          });
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: AppFontFamily.inter),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutsNames.profile);
                      },
                      child: CircleAvatar(
                        radius: 20.r,
                        child: Image.asset(AppImages.user),
                      ),
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
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12),
                  child: Card(
                    color: const Color(0xffF0F9FF),
                    child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          List<UserModel?> user = snapshot.data!;
                          String? userName = snapshot.data?[index]?.userName;
                          if (userName!.contains(searchValue ?? '')) {
                            return ContactItem(
                              model: user[index],
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
                  ),
                );
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

import 'package:eary/core/utilites/app_images.dart';
import 'package:eary/modules/lay_out/view/widgets/custom_listtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utilites/font_manager.dart';
import '../../../../../core/widgets/custom_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F9FF),
      appBar: AppBar(
        title: const CustomText(
          color: Colors.black,
          text: "Settings",
          fontFamily: AppFontFamily.fingerPaintFamily,
        ),
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
      body: Container(
        child: Column(
          children: [
            CustomListTitle(
              title: "Theme",
              onTap: () {
                PopupMenuButton<String>(
                  itemBuilder: (_) {
                    return const [
                      PopupMenuItem<String>(child: Text("Rate Us")),
                      PopupMenuItem<String>(child: Text("Leave a review")),
                      PopupMenuItem<String>(child: Text("Share")),
                      PopupMenuItem<String>(child: Text("Exit")),
                    ];
                  },
                  icon: const Icon(Icons.account_circle),
                );
              },
              image: AppImages.themes,
            ),
            CustomListTitle(
              title: "Languages",
              onTap: () {},
              image: AppImages.languages,
            ),
            CustomListTitle(
              title: "Log Out",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: CustomText(
                        text: "Are you sure log out !!",
                        fontFamily: AppFontFamily.fingerPaintFamily,
                        fontSize: 20.h,
                        color: Colors.black,
                      ),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("cancel"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
              image: AppImages.logOut,
            ),
          ],
        ),
      ),
    );
  }
}

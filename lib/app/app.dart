import 'package:eary/modules/lay_out/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_routes/routes_genirator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411.42, 797.71),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              useMaterial3: true,
            ),
            onGenerateRoute: AppRouts().genirateRoute,

          );
        });
  }
}

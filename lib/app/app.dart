import 'package:eary/core/config/app_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_routes/routes_genirator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppStorage.appBoxListener(),
        builder: (context, box, child) {
          return ScreenUtilInit(
              designSize: const Size(411.42, 797.71),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: Locale(AppStorage.getLocale(), ''),
                  themeMode: AppStorage.getThemeMode(),
                  darkTheme: ThemeData.dark(useMaterial3: true),
                  theme: ThemeData(
                    useMaterial3: true,
                  ),
                  onGenerateRoute: AppRouts().genirateRoute,
// home: ContactProfileScreen(),
                );
              });
        });
  }
}

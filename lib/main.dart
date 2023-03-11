import 'package:eary/core/config/app_storage.dart';
import 'package:eary/firebase_options.dart';
import 'package:eary/modules/authontication/model/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirestoreModel.injectAll([
    UserModel(),
  ]);
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: "assets/translations",
      supportedLocales: const [Locale('en'), Locale('ar')],
      startLocale: Locale(AppStorage.getLocale(), ''),
      fallbackLocale: const Locale('ar'),
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

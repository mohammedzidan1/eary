import 'package:eary/firebase_options.dart';
import 'package:eary/modules/authontication/model/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirestoreModel.injectAll([
    UserModel(),
  ]);
  runApp(const MyApp());
}

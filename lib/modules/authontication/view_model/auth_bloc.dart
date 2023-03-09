import 'package:bloc/bloc.dart';
import 'package:eary/core/app_routes/routes_mames.dart';
import 'package:eary/core/utilites/firbase_auth_util.dart';
import 'package:eary/modules/authontication/model/user.dart';
import 'package:eary/modules/authontication/view_model/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/cupertino.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(const AuthState(isLoading: false));
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  void register(context) async {
    UserModel userModel = UserModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      userName: userNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    User user = await FirebaseAuthUtil().register(
        email: emailController.text, password: passwordController.text);
    userModel.docId = user.uid;
    if (FirebaseAuthUtil.isLogin) {
      await userModel.create(docId: user.uid);
      Navigator.pushReplacementNamed(context, RoutsNames.home);
    }
  }

  void signIn(context) async {
    await FirebaseAuthUtil()
        .signIn(email: emailController.text, password: passwordController.text);
    if (FirebaseAuthUtil.isLogin) {
      getUser();
      Navigator.pushReplacementNamed(context, RoutsNames.home);
    }
  }

  Future<void> getUser() async {
    emit(state.copyWith(isLoading: true));
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      UserModel? userModel =
          await FirestoreModel.use<UserModel>().find(user.uid);
      emit(state.copyWith(userModel: userModel, isLoading: false));
    }
  }

  void signInWithGoogle(context) async {
    UserCredential? user = await FirebaseAuthUtil().signInWithGoogle();

    if (user.user != null) {
      UserModel userModel = UserModel.fromAuth(user.user!);
      if (!await userModel.exists(user.user!.uid)) {
        await userModel.create(docId: user.user!.uid);
      }
      await getUser();
      Navigator.pushReplacementNamed(context, RoutsNames.home);
    } else {}
  }

  void logOut(context) async {
    await FirebaseAuthUtil().logout();
    Navigator.pushReplacementNamed(context, RoutsNames.authentication);
  }
}

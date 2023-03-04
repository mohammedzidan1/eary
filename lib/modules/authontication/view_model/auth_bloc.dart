import 'package:bloc/bloc.dart';
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

  void register() async {
    UserModel userModel = UserModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      userName: userNameController.text,
      email: emailController.text,
    );
    User user = await FirebaseAuthUtil().register(
        email: emailController.text, password: passwordController.text);
    userModel.docId = user.uid;
    if (FirebaseAuthUtil.isLogin) {
      await userModel.create(docId: user.uid);
    }
  }

  void signIn() async {
    await FirebaseAuthUtil()
        .signIn(email: emailController.text, password: passwordController.text);
    if (FirebaseAuthUtil.isLogin) {
      getUser();
      // Navigator.pushReplacementNamed(context, RoutsNames.home);
    }
  }

  Future<void> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      UserModel? userModel =
          await FirestoreModel.use<UserModel>().find(user.uid);
      emit(state.copyWith(userModel: userModel));
      print("userF ${user}");
      print("userModel ${userModel}");
    }
  }
}

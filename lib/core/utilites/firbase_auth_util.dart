import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthUtil {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static bool get isLogin => _auth.currentUser != null;

  Future<User> register(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null!;
  }

  Future<User> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null!;
  }

  Future<UserCredential> signInWithGoogle() async {
    GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleSignIn?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  void changePassword(String password) async {
    //Create an instance of the current user.
    User? user = _auth.currentUser;

    //Pass in the password to updatePassword.
    user?.updatePassword(password).then((_) {
      debugPrint("Successfully changed password");
    }).catchError((error) {
      debugPrint("Password can't be changed $error");
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }
}

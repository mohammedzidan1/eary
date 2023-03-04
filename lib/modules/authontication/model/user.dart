import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_model/firestore_model.dart';

class UserModel extends FirestoreModel<UserModel> {
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  UserModel({
    this.email,
    this.userName,
    this.firstName,
    this.lastName,
    this.password,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    lastName = json['last_name'];
    firstName = json['first_name'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
  }
  UserModel.fromAuth(User user) {
    email = user.email;
    userName = user.displayName;
  }
  @override
  ResponseBuilder<UserModel> get responseBuilder =>
      (json) => UserModel.fromJson(json);

  @override
  Map<String, dynamic> get toMap => {
        'last_name': lastName,
        'first_name': firstName,
        'user_name': userName,
        'email': email,
        'password': password,
      };
  @override
  String get collectionName => 'users';
}

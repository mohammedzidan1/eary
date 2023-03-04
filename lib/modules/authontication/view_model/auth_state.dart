import 'package:eary/modules/authontication/model/user.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool? isLoading;
  final UserModel? userModel;

  const AuthState({
    this.isLoading,
    this.userModel,
  });

  AuthState copyWith({
    bool? isLoading,
    UserModel? userModel,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userModel,
      ];
}

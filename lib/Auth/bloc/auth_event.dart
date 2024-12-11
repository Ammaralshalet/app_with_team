import 'package:equatable/equatable.dart';
import 'package:app_with_team/data/models/user/user_model.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpRequested extends AuthEvent {
  final UserModel userModel;

  SignUpRequested(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;

  LoginRequested(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

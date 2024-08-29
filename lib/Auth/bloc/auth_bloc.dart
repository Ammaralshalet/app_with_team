import 'package:app_with_team/Auth/bloc/auth_event.dart';
import 'package:app_with_team/Auth/bloc/auth_state.dart';
import 'package:app_with_team/service/auth_service.dart';
import 'package:app_with_team/data/models/user/handle_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        ResultUserModel result = await authService.signup(event.userModel);

        if (result is DataSuccess) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', result.token);

          emit(AuthSuccess());
        } else if (result is ErrorData) {
          emit(AuthFailure(result.message));
        } else {
          emit(const AuthFailure('An unknown error occurred'));
        }
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        ResultUserModel result =
            await authService.login(event.username, event.password);

        if (result is DataSuccess) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', result.token);

          emit(AuthSuccess());
        } else if (result is ErrorData) {
          emit(AuthFailure(result.message));
        } else {
          emit(const AuthFailure('An unknown error occurred'));
        }
      } catch (e) {
        emit(AuthFailure('Login failed: ${e.toString()}'));
      }
    });
  }
}

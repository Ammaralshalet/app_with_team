import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app_with_team/Auth/bloc/auth_bloc.dart';
import 'package:app_with_team/Auth/bloc/auth_event.dart';
import 'package:app_with_team/Auth/bloc/auth_state.dart';
import 'package:app_with_team/service/auth_service.dart';
import 'package:app_with_team/data/models/user/user_model.dart';
import 'package:app_with_team/data/models/user/handle_model.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  setUpAll(() {
    registerFallbackValue(UserModel(
      firstName: '',
      lastName: '',
      phone: '',
      username: '',
      birthDate: '',
      password: '',
      confirmPassword: '',
    ));
  });

  late AuthBloc authBloc;
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
    authBloc = AuthBloc(authService: mockAuthService);
  });

  tearDown(() {
    authBloc.close();
  });

  group(
    'AuthBloc Signup',
    () {
      final UserModel testUser = UserModel(
        firstName: 'Ammar',
        lastName: 'Alshalet',
        phone: '0982477589',
        username: 'ammaralshalet9',
        birthDate: '1999-10-01',
        password: 'ammarQ12A3457@',
        confirmPassword: 'ammarQ12A3457@',
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthSuccess] when signup succeeds',
        build: () {
          when(() => mockAuthService.signup(any())).thenAnswer(
            (_) async => DataSuccess(),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(SignUpRequested(testUser)),
        expect: () => [
          AuthLoading(),
          AuthSuccess(),
        ],
        verify: (_) {
          verify(() => mockAuthService.signup(testUser)).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthFailure] when signup fails',
        build: () {
          when(() => mockAuthService.signup(any())).thenAnswer(
            (_) async => ErrorData(message: 'Sign up failed'),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(SignUpRequested(testUser)),
        expect: () => [
          AuthLoading(),
          const AuthFailure('Sign up failed'),
        ],
        verify: (_) {
          verify(() => mockAuthService.signup(testUser)).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits [AuthLoading, AuthFailure] when an exception is thrown during signup',
        build: () {
          when(() => mockAuthService.signup(any()))
              .thenThrow(Exception('Unexpected error'));
          return authBloc;
        },
        act: (bloc) => bloc.add(SignUpRequested(testUser)),
        expect: () => [
          AuthLoading(),
          const AuthFailure('Exception: Unexpected error'),
        ],
        verify: (_) {
          verify(() => mockAuthService.signup(testUser)).called(1);
        },
      );
    },
  );
}

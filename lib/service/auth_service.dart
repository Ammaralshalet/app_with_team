import 'package:app_with_team/core/error/handle_auth_message.dart';
import 'package:app_with_team/data/models/uesr_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;

  final String baseurl =
      "https://rideshare.devscape.online/api/v1/auth/register";

  AuthService(this.dio);

  Future<bool> signup(UserModel user) async {
    try {
      Response response = await dio.post(baseurl, data: user.toMap());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final message = e.response!.data['message'];
        if (message != null &&
            message.contains(
                "Password must contain 1 or more special characters")) {
          throw PasswordHasNotSpeicalCharcter();
        }
      }

      throw Exception("An unexpected error occurred: ${e.message}");
    }
  }
}

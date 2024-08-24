import 'package:app_with_team/core/constants/constants.dart';
import 'package:app_with_team/data/models/user/handle_model.dart';
import 'package:app_with_team/data/models/user/user_model.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;
  final String baseurl = baseurlAuth;

  AuthService(this.dio);

  Future<ResultUserModel> signup(UserModel user) async {
    if (!user.isValid()) {
      return ErrorData(message: "Invalid user data.");
    }

    try {
      Response response = await dio.post(baseurl, data: user.toMap());

      if (response.statusCode == 200 || response.statusCode == 201) {
        return DataSuccess();
      } else if (response.statusCode == 400) {
        return ErrorData(message: response.data['message'] ?? "Bad Request");
      } else {
        return ErrorData(message: "Unexpected error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data['message'] != null) {
        return ErrorData(message: e.response!.data['message']);
      } else {
        return ErrorData(message: "An unexpected error occurred: ${e.message}");
      }
    }
  }
}

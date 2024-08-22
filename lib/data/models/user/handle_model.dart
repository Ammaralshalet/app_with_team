class ResultUserModel {}

class DataSuccess extends ResultUserModel {}

class ErrorData extends ResultUserModel {
  final String message;

  ErrorData({required this.message});
}

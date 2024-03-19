import 'package:dio/dio.dart';
import 'package:sofvare/values/app_strings.dart';

class ServerError implements Exception {
  ServerError.fromDioException({required DioException exception}) {
    _handleError(exception);
  }

  ServerError.fromException(Object error) {
    errorMessage = error.toString();
  }

  late final String? errorMessage;
  late final int? errorCode;

  void _handleError(DioException exception) {
    final response = exception.response;
    errorCode = response?.statusCode;
    final data = exception.response?.data?.toString();
    if (data != null) {
      errorMessage = data;
    } else if (response == null) {
      errorMessage = AppStrings.somethingWentWrong;
    } else {
      errorMessage = exception.message ?? AppStrings.somethingWentWrong;
    }
  }
}

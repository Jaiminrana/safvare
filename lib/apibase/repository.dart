import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sofvare/apibase/apiservice.dart';
import 'package:sofvare/apibase/header_intercepter.dart';
import 'package:sofvare/apibase/server_error.dart';
import 'package:sofvare/model/match.dart';
import 'package:sofvare/values/app_constants.dart';

class Repository {
  Repository._();

  late ApiService _apiService;

  final logInterceptor = LogInterceptor(
    requestBody: !kReleaseMode,
    responseBody: !kReleaseMode,
    request: !kReleaseMode,
    requestHeader: !kReleaseMode,
    responseHeader: !kReleaseMode,
  );

  static final Repository instance = Repository._();

  void initialise() {
    final dio = Dio();

    dio.interceptors.add(
      HeaderInterceptor(),
    );

    _apiService = ApiService(
      dio: dio,
      baseUrl: AppConstants.baseUrl,
    );
  }

  Future<List<Team>?> getMatchDetails() async {
    final result = await _apiCall(
      request: () => _apiService.getMatchDetails(),
    );
    return result.teams;
  }

  Future<List<Team>?> getOtherMatchDetails() async {
    final result = await _apiCall(
      request: () => _apiService.getOtherMatchDetails(),
    );
    return result.teams;
  }

  Future<T> _apiCall<T>({required AsyncValueGetter<T> request}) async {
    try {
      final response = await request();
      return response;
    } on DioException catch (error) {
      throw ServerError.fromDioException(exception: error);
    }
  }
}

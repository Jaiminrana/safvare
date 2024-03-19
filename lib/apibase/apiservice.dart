import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sofvare/model/match.dart';

part 'apiservice.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({required Dio dio, required String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('cricket/live/json/nzin01312019187360.json')
  Future<Teams> getMatchDetails();

  @GET('cricket/live/json/sapk01222019186652.json')
  Future<Teams> getOtherMatchDetails();
}

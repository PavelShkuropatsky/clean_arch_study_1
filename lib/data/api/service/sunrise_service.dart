import 'package:clean_arch_study_1/data/api/request/get_day_body.dart';
import 'package:dio/dio.dart';

import '../model/api_day.dart';

class SunriseService {
  static const _baseUrl = 'https://api.sunrise-sunset.org';

  final _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<ApiDay> getDay({required GetDayBody body}) async {
    final response = await _dio.get('/json', queryParameters: body.toJson);

    return ApiDay.fromJson(response.data);
  }
}

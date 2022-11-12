import 'package:clean_arch_study_1/data/api/request/get_day_body.dart';
import 'package:clean_arch_study_1/data/api/service/sunrise_service.dart';
import 'package:clean_arch_study_1/data/mapper/day_mapper.dart';

import '../../domain/model/day.dart';

class ApiUtil {
  final SunriseService _sunriseService;

  ApiUtil(this._sunriseService);

  Future<Day> getDay({
    required double latitude,
    required double longitude,
  }) async {
    final requestBody = GetDayBody(latitude: latitude, longitude: longitude);
    final apiDay = await _sunriseService.getDay(body: requestBody);
    
    return DayMapper.fromApi(apiDay);
  }
}

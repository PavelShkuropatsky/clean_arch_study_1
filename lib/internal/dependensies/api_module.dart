import 'package:clean_arch_study_1/data/api/api_util.dart';

import '../../data/api/service/sunrise_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil get apiUtil {
    _apiUtil ??= ApiUtil(SunriseService());

    return _apiUtil!;
  }
}
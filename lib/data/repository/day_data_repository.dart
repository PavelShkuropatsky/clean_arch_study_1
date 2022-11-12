import 'package:clean_arch_study_1/domain/model/day.dart';

import '../../domain/repository/day_repository.dart';
import '../api/api_util.dart';

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  @override
  Future<Day> getDay({required double latitude, required double longitude}) =>
      _apiUtil.getDay(latitude: latitude, longitude: longitude);
}

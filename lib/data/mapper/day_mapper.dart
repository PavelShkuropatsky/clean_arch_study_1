import '../../domain/model/day.dart';
import '../api/model/api_day.dart';

class DayMapper {
  static final _nullDate = DateTime(1900, 1, 1);

  static Day fromApi(ApiDay apiDay) {
    return Day(
      sunrise: DateTime.tryParse(apiDay.sunrise) ?? _nullDate,
      sunset: DateTime.tryParse(apiDay.sunset) ?? _nullDate,
      solarNoon: DateTime.tryParse(apiDay.solarNoon) ?? _nullDate,
      dayLength: apiDay.dayLength.toInt(),
    );
  }
}

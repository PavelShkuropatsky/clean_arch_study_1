class ApiDay {
  final String sunrise;
  final String sunset;
  final String solarNoon;
  final num dayLength;

  ApiDay.fromJson(Map<String, dynamic> json)
      : sunrise = json['results'] ['sunrise'],
        sunset = json['results'] ['sunset'],
        solarNoon = json['results'] ['solar_noon'],
        dayLength = json['results'] ['day_length'];
}
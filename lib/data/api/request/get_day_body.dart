class GetDayBody {
  final double latitude;
  final double longitude;

  GetDayBody({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> get toJson => {
        'lat': latitude,
        'lon': longitude,
        'formatted': 0,
      };
}

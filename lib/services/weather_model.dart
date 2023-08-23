class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String weatherStateIcon;
  String cityName;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState,
      required this.weatherStateIcon,
      required this.cityName,
      });
  factory WeatherModel.fromJson(dynamic json) {
    var jsonData = json['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: json['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherState: jsonData['condition']['text'],
      weatherStateIcon: jsonData['condition']['icon'],
      cityName: json['location']['name'],
    );
  }
  @override
  String toString() {
    return 'date: $date, temp: $temp';
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/services/weather_model.dart';
class WeatherServices{
  String baseUrl='http://api.weatherapi.com/v1';
  String apiKey='575207548cae4163a40201423231203';
  Future<dynamic> getWeather({required String cityName})async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
     WeatherModel weather = WeatherModel.fromJson(data);
    print (weather);
   return weather ;
  }
}
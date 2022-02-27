import 'dart:convert';
import 'package:http/http.dart' as http;


class WeatherAPI {

  String statusWeather, weatherIcon, city;

  WeatherAPI({
    required this.statusWeather,
    required this.weatherIcon,
    required this.city,
  });

  factory WeatherAPI.createWeather(Map<String, dynamic> object) {
    return WeatherAPI(
      statusWeather: object['text'],
      weatherIcon: object['icon'],
      city: '',
    );
  }

  static Future<WeatherAPI> connectToAPI(
    String statusWeather, String weatherIcon, String city) async {
      String linkcity = city;
      String apiURL =
          "http://api.weatherapi.com/v1/current.json?key=1f30d13c0dde42eb9cd41135221702&q=$linkcity&aqi=no";  
      final Parameters = {
        'q': city,
        'aqi' : 'no'
      };

      var apiResult = await http.get(Uri.parse(apiURL));
      var jsonObject = json.decode(apiResult.body);
      var weatherData =
          (jsonObject as Map<String, dynamic>)['current']['condition'];

      return WeatherAPI.createWeather(weatherData);
  }

}
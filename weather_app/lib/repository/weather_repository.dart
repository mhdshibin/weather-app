import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather.dart';

final dio = Dio();

Future<WeatherData> fetchWeatherInfo(double latitude, double longitude) async {
  try {
    Response response;
    response = await dio.get(
      'https://api.open-meteo.com/v1/forecast?daily=temperature_2m_max&',
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'current_weather': true,
        'forecast_days': 6,
        'timezone': 'Asia/Kolkata',
        'daily' : 'weathercode'
      },
    );
    // print(response.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = json.decode(response.toString());
      WeatherData weatherData = WeatherData.fromJson(parsed);
      // print(weatherData);
      return weatherData;
    } else {
      throw Exception();
    }
  } catch (e) {
    throw Exception(e);
  }
}

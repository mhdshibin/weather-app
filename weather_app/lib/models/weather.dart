// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'dart:convert';

WeatherData weatherDataFromJson(String str) => WeatherData.fromJson(json.decode(str));

class WeatherData {
    double latitude;
    double longitude;
    int utcOffsetSeconds;
    String timezone;
    String timezoneAbbreviation;
    CurrentWeather currentWeather;
    Daily daily;

    WeatherData({
        required this.latitude,
        required this.longitude,
        required this.utcOffsetSeconds,
        required this.timezone,
        required this.timezoneAbbreviation,
        required this.currentWeather,
        required this.daily,
    });

    factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        currentWeather: CurrentWeather.fromJson(json["current_weather"]),
        daily: Daily.fromJson(json["daily"]),
    );
}

class CurrentWeather {
    double temperature;
    int weathercode;
    int isDay;
    String time;

    CurrentWeather({
        required this.temperature,
        required this.weathercode,
        required this.isDay,
        required this.time,
    });

    factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        temperature: json["temperature"]?.toDouble(),
        weathercode: json["weathercode"],
        isDay: json["is_day"],
        time: json["time"],
    );
}

class Daily {
    List<DateTime> time;
    List<double> temperature2MMax;
    List<int> weathercode;

    Daily({
        required this.time,
        required this.temperature2MMax,
        required this.weathercode,
    });

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        temperature2MMax: List<double>.from(json["temperature_2m_max"].map((x) => x?.toDouble())),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
    );
}

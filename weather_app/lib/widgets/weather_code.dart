import 'package:flutter/material.dart';
import 'package:weather_app/constants/theme.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIconDescription {
  IconData icon;
  String desc;

  WeatherIconDescription({required this.icon, required this.desc});
}

class WeatherIcon extends StatelessWidget {
  final WeatherIconDescription wID;
  const WeatherIcon({Key? key, required this.wID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        Text(wID.desc, style: TextStyle(fontSize: 20,
                    color: WTheme.white,),),
        SizedBox(width: 15),
        Icon(wID.icon),
      ],
    );
  }
}

WeatherIconDescription weatherCodeIconMapper(int weatherCode) {
  final WeatherIconDescription wID;
  Map<int, WeatherIconDescription> map = {
    0: WeatherIconDescription(icon: WeatherIcons.cloud, desc: "Clear sky"),
    1: WeatherIconDescription(
        icon: WeatherIcons.day_sunny, desc: "Mainly clear"),
    2: WeatherIconDescription(
        icon: WeatherIcons.day_cloudy, desc: "Partly cloudy"),
    3: WeatherIconDescription(
        icon: WeatherIcons.day_sunny_overcast, desc: "Overcast"),
    45: WeatherIconDescription(icon: WeatherIcons.day_fog, desc: "Fog"),
    48: WeatherIconDescription(
        icon: WeatherIcons.fog, desc: "Depositing Rime Frog"),
    51: WeatherIconDescription(
        icon: WeatherIcons.raindrop, desc: "Light Drizzle"),
    53: WeatherIconDescription(
        icon: WeatherIcons.raindrops, desc: "Moderate Drizzle"),
    55: WeatherIconDescription(icon: WeatherIcons.rain, desc: "Dense Drizzle"),
    56: WeatherIconDescription(
        icon: WeatherIcons.rain_mix, desc: "Freezing Light Drizzle"),
    57: WeatherIconDescription(
        icon: WeatherIcons.rain_mix, desc: "Freezing Heavy Drizzle"),
    61: WeatherIconDescription(
        icon: WeatherIcons.night_rain, desc: "Slight Rain"),
    63: WeatherIconDescription(
        icon: WeatherIcons.night_rain_wind, desc: "Moderate Rain"),
    65: WeatherIconDescription(
        icon: WeatherIcons.night_alt_rain, desc: "Heavy Intensity Rain"),
    66: WeatherIconDescription(
        icon: WeatherIcons.night_alt_rain_wind, desc: "Freezing Light Rain"),
    67: WeatherIconDescription(
        icon: WeatherIcons.night_alt_rain_wind, desc: "Freezing Heavy Rain"),
    71: WeatherIconDescription(
        icon: WeatherIcons.snow, desc: "Slight Snow Fall"),
    73: WeatherIconDescription(
        icon: WeatherIcons.snow_wind, desc: "Moderate Snow Fall"),
    75: WeatherIconDescription(
        icon: WeatherIcons.snowflake_cold, desc: "Heavy Snow Fall"),
    77: WeatherIconDescription(
        icon: WeatherIcons.day_snow, desc: "Snow Grains"),
    80: WeatherIconDescription(
        icon: WeatherIcons.rain, desc: "Slight Rain Showers"),
    81: WeatherIconDescription(
        icon: WeatherIcons.rain_mix, desc: "Moderate Rain Showers"),
    82: WeatherIconDescription(
        icon: WeatherIcons.rain_wind, desc: "Heavy Rain Showers"),
    85: WeatherIconDescription(
        icon: WeatherIcons.night_snow, desc: "Slight Snow Showers"),
    86: WeatherIconDescription(
        icon: WeatherIcons.night_alt_snow, desc: "Heavy Snow Showers"),
    95: WeatherIconDescription(
        icon: WeatherIcons.thunderstorm, desc: "Thunderstorm"),
    96: WeatherIconDescription(
        icon: WeatherIcons.day_snow_thunderstorm, desc: "Slight thunderstorm"),
    99: WeatherIconDescription(
        icon: WeatherIcons.night_alt_snow_thunderstorm,
        desc: "Heavy hail thunderstorm"),
  };
  wID = map.entries.firstWhere((entry) => entry.key == weatherCode).value;
  return wID;
}

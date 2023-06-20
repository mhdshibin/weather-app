import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/enums.dart';
import 'package:weather_app/constants/general.dart';
import 'package:weather_app/widgets/weather_code.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repository/location_repository.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textFieldController = TextEditingController();
  States editStates = States.initial;
  late String title;
  String? locationName;
  bool toggleValue = true;
  double? cDegrees;
  double? fDegrees;
  int? weatherCode;
  Location? location;
  List<String>? day;
  List<double>? degree;
  List<WeatherIcon>? wIcon;
  String suffixChar = '°C';
  List<String> options = [
    'Kolkata',
    'Delhi',
    'New York',
    'California',
    'Chicago',
    'Dubai',
    'Switzerland'
  ];
  @override
  void onInit() {
    super.onInit();
    locationName = textEditingController.text;
    cDegrees;
    toggleValue ? suffixChar = '°C' : suffixChar = '°F';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSuffixTapped() {
    textEditingController.clear();
    update();
  }

  void onSwitchToggle(bool value) {
    if (cDegrees != null) fDegrees = cDegrees! * (9 / 5) + 32;
    toggleValue = value;
    toggleValue ? suffixChar = '°C' : suffixChar = '°F';
    update();
  }

  onOptionSelected(int value) {
    onSubmitted(options[value]);
  }

  Future<dynamic> onSubmitted(String value) async {
    try {
      editStates = States.loading;
      if (value != "") {
        if (locationName != null) await getLocationList(value);
        if (location != null) await getWeatherDetails();
        editStates = States.success;
        update();
      }
    } catch (e) {
      States.failed;
      throw Exception(e);
    }
  }

  Future<void> getLocationList(String value) async {
    try {
      LocationList locationList = await fetchLocationInfo(value);
      location = locationList.results.first;
      locationName = location?.name;
      update();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getWeatherDetails() async {
    try {
      WeatherData weatherData =
          await fetchWeatherInfo(location!.latitude, location!.longitude);
      cDegrees = weatherData.currentWeather.temperature;
      weatherCode = weatherData.currentWeather.weathercode;
      // day = List.from(weatherData.daily.time.whereType());
      day = weatherData.daily.time.map((e) => e.toString()).toList();
      wIcon = weatherData.daily.weathercode
          .map((e) => WeatherIcon(wID: weatherCodeIconMapper(e)))
          .toList();
      degree = List.from(weatherData.daily.temperature2MMax);

      if (day != null) {
        day!.removeAt(0);
        for (var i = 0; i < day!.length; i++) {
          day![i] = getWeekdayFromDate(day![i]);
        }
        // for (var element in day!) {
        //   element = getWeekdayFromDate(element);
        // }
        day![0] = 'Tomorrow';
      }
      if (degree != null) degree!.removeAt(0);

      update();
    } catch (e) {
      throw Exception(e);
    }
  }
}

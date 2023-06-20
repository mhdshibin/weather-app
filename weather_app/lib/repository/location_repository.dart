import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/models/location.dart';

final dio = Dio();

Future<LocationList> fetchLocationInfo(String queryLocation) async {
  try {
    LocationList location;
    Response response;
    response = await dio.get(
      'https://geocoding-api.open-meteo.com/v1/search',
      queryParameters: {'name': queryLocation},
    );
    // print(response.data.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = json.decode(response.toString());
      //statusCode still retuns true even if query doesn't find any match.
      //so we will check length of response, if there's a match there will be 2 items.
      //else only 1.
      if (parsed.length < 2) throw ();
      location = LocationList.fromJson(parsed);
      if (location.results.isEmpty) throw ();
      // print(location.results);
      return location;
    } else
      throw ();
  } catch (e) {
    throw Exception(e);
  }
}

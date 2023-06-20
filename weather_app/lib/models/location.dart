import 'dart:convert';

LocationList locationFromJson(String str) =>
    LocationList.fromJson(json.decode(str));

class LocationList {
  List<Location> results;

  LocationList({
    required this.results,
  });

  factory LocationList.fromJson(Map<String, dynamic> json) => LocationList(
        results:
            List<Location>.from(json["results"].map((x) => Location.fromJson(x))),
      );
}

class Location {
  int id;
  String name;
  double latitude;
  double longitude;

  Location({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );
}

import 'package:flutterappexample/models/CityLocation.dart';

class BikeShareCity {
  final String href;
  final String id;
  final CityLocation location;
  final String name;

  BikeShareCity({this.href, this.id, this.location, this.name});

  factory BikeShareCity.fromJson(Map<String, dynamic> json) {
    return BikeShareCity(
      href: json['href'],
      id: json['id'],
      location: CityLocation.fromJson(json['location']),
      name: json['name']
    );
  }
}
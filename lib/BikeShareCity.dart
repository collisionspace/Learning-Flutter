import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<BikeShareCityResponse> fetchBikeShare() async {
  final response = await http.get('https://api.citybik.es/v2/networks');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return BikeShareCityResponse.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}

class BikeShareCityResponse {
  final List<BikeShareCity> networks;

  BikeShareCityResponse({this.networks});

  factory BikeShareCityResponse.fromJson(Map<String, dynamic> json) {
    var decoded = json['networks'] as List;
    return BikeShareCityResponse(networks: decoded.map((model)=> BikeShareCity.fromJson(model)).toList());
  }
}

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

class CityLocation {
  String city;
  final String country;
  final double latitude;
  final double longitude;

  CityLocation({this.city, this.country, this.latitude, this.longitude});

  factory CityLocation.fromJson(Map<String, dynamic> json) {
    return CityLocation(
      city: json['city'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude']
    );
  }
}
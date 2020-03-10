import 'dart:async';
import 'dart:convert';
import 'package:flutterappexample/models/BikeShareCity.dart';
import 'package:http/http.dart' as http;

Future<BikeShareCityResponse> fetchBikeShare() async {
  final response = await http.get('https://api.citybik.es/v2/networks');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return BikeShareCityResponse.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load bike shares');
  }
}

class BikeShareCityResponse {
  final List<BikeShareCity> networks;

  BikeShareCityResponse({this.networks});

  factory BikeShareCityResponse.fromJson(Map<String, dynamic> json) {
    List decoded = json['networks'];
    return BikeShareCityResponse(networks: decoded.map((model)=> BikeShareCity.fromJson(model)).toList());
  }
}

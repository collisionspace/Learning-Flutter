class CityLocation {
  final String city;
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
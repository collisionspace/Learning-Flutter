import 'package:flutterappexample/models/BikeShareCity.dart';

class BikeShareRowViewModel {
  final String name;
  final String city;
  final String country;
  String get cityCountry {
    return city + ", " + country;
  }

  BikeShareRowViewModel(this.name, this.city, this.country);
}

// ignore: sdk_version_extension_methods
extension ListViewModels on List<BikeShareCity> {
  List<BikeShareRowViewModel> get listViewModels {
    return map (
              (bikeShare) => BikeShareRowViewModel(bikeShare.name, bikeShare.location.city, bikeShare.location.country)
      ).toList();
    }
}
import 'package:flutter/material.dart';
import 'package:flutterappexample/BikeShareList.dart';
import 'package:flutterappexample/view_models/BikeShareRowViewModel.dart';

import 'models/BikeShareCityResponse.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<BikeShareCityResponse> futureBikeShare;

  @override
  void initState() {
    super.initState();
    futureBikeShare = fetchBikeShare();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Share Cities',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bike Share Cities'),
        ),
        body: Center(
          child: FutureBuilder<BikeShareCityResponse>(
            future: futureBikeShare,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return BikeShareList(snapshot.data.networks.listViewModels);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
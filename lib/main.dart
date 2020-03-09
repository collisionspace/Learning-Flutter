import 'package:flutter/material.dart';
import 'package:flutterappexample/BikeShareCity.dart';

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
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<BikeShareCityResponse>(
            future: futureBikeShare,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.networks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new ListTile(title: Text(snapshot.data.networks[index].name),
                        subtitle: Text(snapshot.data.networks[index].location.city + ", " + snapshot.data.networks[index].location.country));
                  },
                );
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
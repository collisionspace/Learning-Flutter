import 'package:flutter/material.dart';
import 'view_models/BikeShareRowViewModel.dart';

class BikeShareList extends StatelessWidget {
  final List<BikeShareRowViewModel> viewModels;

  const BikeShareList(this.viewModels);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModels.length,
      itemBuilder: (BuildContext context, int index) {
        return BikeShareRow(viewModels[index]);
      },
    );
  }
}

class BikeShareRow extends StatelessWidget {
  final BikeShareRowViewModel viewModel;

  const BikeShareRow(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(viewModel.name),
        subtitle: Text(viewModel.cityCountry),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print(viewModel.name);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BikeShareDetailWidget(text: viewModel.name),
              ));
      },
    );
  }
}

class BikeShareDetailWidget extends StatelessWidget {
  final String text;

  const BikeShareDetailWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Card Widget",
            style: TextStyle(color: Colors.green),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.green,
        body: Container(
          margin: EdgeInsets.all(16),
          child: ListView(
            children: [
              buildCard(Icons.directions_bike, "Direction Bike"),
              buildCard(Icons.directions_car, "Direction Car"),
              buildCard(Icons.directions_bus, "Direction Bus"),
            ],
          ),
        ),
      ),
    );
  }
}

Card buildCard(IconData iconData, String text) {
  return Card(
    elevation: 8,
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          child: Icon(
            iconData,
            color: Colors.green,
          ),
        ),
        Text(text),
      ],
    ),
  );
}

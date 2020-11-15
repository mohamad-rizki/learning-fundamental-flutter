import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Media Query",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: generateContainers(),
            )
          : Row(
              children: generateContainers(),
            ),
    );
  }
}

List<Widget> generateContainers() {
  return [
    Flexible(
      flex: 1,
      child: Container(
        color: Colors.red,
      ),
    ),
    Flexible(
      flex: 1,
      child: Container(
        color: Colors.green,
      ),
    ),
    Flexible(
      flex: 1,
      child: Container(
        color: Colors.blue,
      ),
    ),
  ];
}

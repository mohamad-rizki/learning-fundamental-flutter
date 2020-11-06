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
          title: Text("Image Widget"),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Container(
            color: Colors.amber,
            width: 300,
            height: 300,
            padding: EdgeInsets.all(8),
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage("images/wallpaper_flutter.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

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
          leading: Icon(
            Icons.adb,
            color: Colors.white,
          ),
          title: Text(
            "App Bar Example",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage("images/beige_paper.png"),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Text Style"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Ini Text SyneMono",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "SyneMono",
                  color: Colors.amber,
                  decoration: TextDecoration.overline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationThickness: 2),
            ),
            Text(
              "Ini Text Sacramento",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Sacramento",
                  color: Colors.amber,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.purple,
                  decorationStyle: TextDecorationStyle.double),
            ),
            Text(
              "Ini Text DancingScript",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "DancingScript",
                  color: Colors.amber,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationStyle: TextDecorationStyle.wavy,
                  decorationThickness: 8),
            ),
            Text(
              "Ini Text Default",
              style: TextStyle(fontSize: 24, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}

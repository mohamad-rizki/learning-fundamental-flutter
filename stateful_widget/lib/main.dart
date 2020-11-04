import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void _increaseCounter() {
    setState(() {
      counter = counter + 1;
    });
  }

  void _decreaseCounter() {
    setState(() {
      counter = counter - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stateful Widget"),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total Counter",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              Text(
                counter.toString(),
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 8 + counter.toDouble()),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text("Increase"),
                onPressed: _increaseCounter,
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("Decrease"),
                onPressed: _decreaseCounter,
              )
            ],
          ),
        ),
      ),
    );
  }
}

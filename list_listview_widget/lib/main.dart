import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgetList = [];
  int counter = 1;

  void _increaseData() {
    setState(() {
      widgetList.add(Text("Data #" + counter.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),));
      counter++;
    });
  }

  void _decreaseData() {
    setState(() {
      widgetList.removeLast();
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List ListView Widget"),
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: _increaseData,
                  child: Text("Increase Data"),
                ),
                RaisedButton(
                  onPressed: _decreaseData,
                  child: Text("Decrease Data"),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgetList,
            )
          ],
        ),
      ),
    );
  }
}

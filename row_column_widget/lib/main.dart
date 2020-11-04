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
          title: Text("Row Column"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Rambu Lalu Lintas"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Berhenti",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Hati-Hati",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  color: Colors.green,
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Mulai Jalan",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Text("Contoh Row"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Row #1"),
                Text("Row #2"),
                Text("Row #3"),
              ],
            ),
            Text("Contoh Column"),
            Column(
              children: [
                Text("Column #1"),
                Text("Column #2"),
                Text("Column #3"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

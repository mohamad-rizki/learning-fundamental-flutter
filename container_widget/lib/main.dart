import 'dart:ffi';

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
          title: Text("Container Widget"),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(8, 12, 16, 18),
          padding: EdgeInsets.all(24),
          color: Colors.blue,
          child: SolidGradient(),
        ),
      ),
    );
  }
}

class SolidGradient extends Container {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.greenAccent),
      child: ContainerGradient(),
    );
  }
}

class ContainerGradient extends Container {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.5, horizontal: 14.5),
      decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.purpleAccent, Colors.pinkAccent], radius: 0.75)),
    );
  }
}

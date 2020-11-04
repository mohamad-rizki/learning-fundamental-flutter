import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _controller;
  double _itemSize = 100.0;

  void _scrollToTop() {
    // Without animation
    // _controller.jumpTo(0);

    // With animation
    _controller.animateTo(0,
        duration: Duration(milliseconds: 1500), curve: Curves.linear);
    setState(() {});
  }

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Stack Align Widget"),
        ),
        body: Stack(
          children: [
            // First Layer: Background
            LayerBackground(),
            // Second Layer: List of Text
            LayerText(
              controller: _controller,
              itemSize: _itemSize,
            ),
            // Third Layer: Button
            LayerButton(
              callback: _scrollToTop,
            ),
          ],
        ),
      ),
    );
  }
}

class LayerBackground extends Container {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.black12,
                ),
              )
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.black12,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class LayerText extends Container {
  final ScrollController controller;
  final double itemSize;

  LayerText({this.controller, this.itemSize});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemExtent: itemSize,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(16),
          child: Text(
            "This text $index is came from center layer of stack",
            style: TextStyle(fontSize: 24),
          ),
        );
      },
    );
  }
}

class LayerButton extends Container {
  final VoidCallback callback;

  LayerButton({this.callback});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.75),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        onPressed: callback,
        child: Text(
          "Scroll To Top",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        color: Colors.blueGrey,
      ),
    );
  }
}

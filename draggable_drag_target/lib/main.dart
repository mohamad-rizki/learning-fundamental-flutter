import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color colorOne = Colors.red;
  Color colorTwo = Colors.blue;
  Color colorTarget = Colors.grey;
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Draggable, Drag Target"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Draggable<Color>(
                  data: colorOne,
                  feedback: SizedBox(
                    width: 60,
                    height: 60,
                    child: Material(
                      color: colorOne.withOpacity(0.7),
                      shape: StadiumBorder(),
                      elevation: 8,
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    width: 60,
                    height: 60,
                    child: Material(
                      color: Colors.grey,
                      shape: StadiumBorder(),
                    ),
                  ),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Material(
                      color: colorOne,
                      shape: StadiumBorder(),
                      elevation: 8,
                    ),
                  ),
                ),
                Draggable<Color>(
                  data: colorTwo,
                  feedback: SizedBox(
                    width: 60,
                    height: 60,
                    child: Material(
                      color: colorTwo.withOpacity(0.7),
                      shape: StadiumBorder(),
                      elevation: 8,
                    ),
                  ),
                  childWhenDragging: SizedBox(
                    width: 60,
                    height: 60,
                    child: Material(
                      color: Colors.grey,
                      shape: StadiumBorder(),
                    ),
                  ),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Material(
                      color: colorTwo,
                      shape: StadiumBorder(),
                      elevation: 8,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DragTarget<Color>(
                    onWillAccept: (value) => true,
                    onAccept: (value) {
                      isAccepted = true;
                      colorTarget = value;
                    },
                    builder: (context, candidates, rejected) {
                      return (isAccepted)
                          ? SizedBox(
                              width: 80,
                              height: 80,
                              child: Material(
                                color: colorTarget,
                                shape: StadiumBorder(),
                              ),
                            )
                          : SizedBox(
                              width: 80,
                              height: 80,
                              child: Material(
                                color: Colors.grey,
                                shape: StadiumBorder(),
                              ),
                            );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

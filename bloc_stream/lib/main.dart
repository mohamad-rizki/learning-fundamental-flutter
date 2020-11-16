import 'package:bloc_stream/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    colorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            "BLoC Stream",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: StreamBuilder<ColorState>(
            stream: colorBloc.stateStream,
            initialData: ColorState(Colors.grey, "Grey"),
            builder: (context, snapshot) {
              return AnimatedContainer(
                width: 100,
                height: 100,
                color: snapshot.data.color,
                duration: Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    snapshot.data.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Text("R"),
              backgroundColor: Colors.red,
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.to_red);
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              child: Text("B"),
              backgroundColor: Colors.blue,
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.to_blue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bloc_library/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        create: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "BLoC Library",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, snapshot) {
            return AnimatedContainer(
              width: 100,
              height: 100,
              color: snapshot.color,
              duration: Duration(milliseconds: 500),
              child: Center(
                child: Text(
                  snapshot.name,
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
            onPressed: () {
              context.read<ColorBloc>().add(ColorEvent.to_red);
            },
            child: Text("R"),
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ColorEvent.to_green);
            },
            child: Text("G"),
            backgroundColor: Colors.green,
          ),
          SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ColorEvent.to_blue);
            },
            child: Text("B"),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

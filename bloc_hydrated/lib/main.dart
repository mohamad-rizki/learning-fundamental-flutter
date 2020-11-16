import 'package:bloc_hydrated/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(), child: MainPage()),
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
          "BLoC Hydrated",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<ColorBloc, ColorState>(
              builder: (context, snapshot) {
                return AnimatedContainer(
                  width: 160,
                  height: 160,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text(
                      "RED",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      context.read<ColorBloc>().add(ColorEvent.to_red);
                    },
                  ),
                  TextButton(
                    child: Text(
                      "GREEN",
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      context.read<ColorBloc>().add(ColorEvent.to_green);
                    },
                  ),
                  TextButton(
                    child: Text(
                      "BLUE",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      context.read<ColorBloc>().add(ColorEvent.to_blue);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

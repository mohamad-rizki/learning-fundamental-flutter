import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum ColorEvent {
  to_red,
  to_green,
  to_blue,
}

class ColorState {
  Color color;
  String name;

  ColorState(this.color, this.name);
}

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorState _colorState = ColorState(Colors.grey, "Grey");

  ColorBloc() : super(ColorState(Colors.grey, "Grey"));

  @override
  Stream<ColorState> mapEventToState(ColorEvent event) async* {
    if (event == ColorEvent.to_red) {
      _colorState = ColorState(Colors.red, "Red");
    } else if (event == ColorEvent.to_green) {
      _colorState = ColorState(Colors.green, "Green");
    } else if (event == ColorEvent.to_blue) {
      _colorState = ColorState(Colors.blue, "Blue");
    } else {
      _colorState = ColorState(Colors.grey, "Grey");
    }
    yield _colorState;
  }
}

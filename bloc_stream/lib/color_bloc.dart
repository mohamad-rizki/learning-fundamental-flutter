import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { to_red, to_blue }

class ColorState {
  Color color;
  String name;

  ColorState(this.color, this.name);
}

class ColorBloc {
  ColorState _color = ColorState(Colors.grey, "Grey");

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();

  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<ColorState> _stateController =
      StreamController<ColorState>();

  StreamSink<ColorState> get stateSink => _stateController.sink;

  Stream<ColorState> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_red) {
      _color = ColorState(Colors.red, "Red");
    } else if (colorEvent == ColorEvent.to_blue) {
      _color = ColorState(Colors.blue, "Blu");
    } else {
      _color = ColorState(Colors.grey, "Grey");
    }

    stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}

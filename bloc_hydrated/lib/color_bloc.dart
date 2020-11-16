import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

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

class ColorBloc extends Bloc<ColorEvent, ColorState> with HydratedMixin {
  ColorBloc() : super(ColorState(Colors.grey, "Grey")) {
    hydrate();
  }

  @override
  Stream<ColorState> mapEventToState(ColorEvent event) async* {
    if (event == ColorEvent.to_red) {
      yield ColorState(Colors.red, "Red");
    } else if (event == ColorEvent.to_green) {
      yield ColorState(Colors.green, "Green");
    } else if (event == ColorEvent.to_blue) {
      yield ColorState(Colors.blue, "Blue");
    } else {
      yield ColorState(Colors.grey, "Grey");
    }
  }

  @override
  ColorState fromJson(Map<String, dynamic> json) {
    try {
      return ColorState(Color(json["color"] as int), json["name"]);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ColorState state) {
    try {
      return <String, dynamic>{
        "color": state.color.value,
        "name": state.name,
      };
    } catch (_) {
      return null;
    }
  }
}

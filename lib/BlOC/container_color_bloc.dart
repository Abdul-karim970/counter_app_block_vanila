import 'dart:async';

import 'package:block_counter/BlOC/container_color_events.dart';
import 'package:block_counter/BlOC/container_color_state.dart';
import 'package:flutter/material.dart';

class ColorBloc {
  final StreamController<ColorEvents> _eventStreamController =
      StreamController();
  final StreamController<ColorState> _stateStreamController =
      StreamController();

  StreamSink<ColorEvents> get eventSink => _eventStreamController.sink;
  Stream<ColorState> get stateStream => _stateStreamController.stream;

  ColorBloc() {
    _eventStreamController.stream.listen(mapEventToState);
  }

  ColorState state = ColorState(Colors.black);
  void mapEventToState(ColorEvents event) {
    if (event is RedColorEvent) {
      state = ColorState(Colors.red);
      _stateStreamController.sink.add(state);
    } else {
      state = ColorState(Colors.blueGrey);
      _stateStreamController.sink.add(state);
    }
  }
}

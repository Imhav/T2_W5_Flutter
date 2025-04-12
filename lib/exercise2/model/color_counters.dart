// model/color_counters.dart
import 'package:flutter/material.dart';

class ColorCounters extends ChangeNotifier {
  int _redTaps = 0;
  int _blueTaps = 0;

  int get redCount => _redTaps;
  int get blueCount => _blueTaps;

  void incrementRed() {
    _redTaps++;
    notifyListeners();
  }

  void incrementBlue() {
    _blueTaps++;
    notifyListeners();
  }
}

// saved_timers.dart
import 'package:flutter/material.dart';

class SavedTimers extends ChangeNotifier {
  List<String> _savedTimers = [];

  List<String> get savedTimers => _savedTimers;

  void addTimer(String timer) {
    _savedTimers.add(timer);
    notifyListeners();
  }
}

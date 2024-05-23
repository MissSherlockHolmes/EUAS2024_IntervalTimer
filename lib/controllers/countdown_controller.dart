// lib/controllers/countdown_controller.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/interval_model.dart';

class CountdownController extends ChangeNotifier {
  IntervalModel _intervalModel;
  Timer? _timer;

  CountdownController()
      : _intervalModel = IntervalModel(
    remainingSeconds: 10,
    intervals: [10],
    currentIntervalIndex: 0,
    isRunning: false,
  );

  IntervalModel get intervalModel => _intervalModel;

  void startCountdown(List<TextEditingController> controllers) {
    stopCountdown(); // Ensure any existing timer is stopped

    _intervalModel.intervals = controllers.map((controller) {
      return int.tryParse(controller.text) ?? 10;
    }).toList();

    _intervalModel.currentIntervalIndex = 0;
    _intervalModel.remainingSeconds = _intervalModel.intervals[_intervalModel.currentIntervalIndex];
    _intervalModel.isRunning = true;

    resumeCountdown();
  }

  void resumeCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_intervalModel.remainingSeconds <= 0) {
        _intervalModel.currentIntervalIndex = (_intervalModel.currentIntervalIndex + 1) % _intervalModel.intervals.length;
        _intervalModel.remainingSeconds = _intervalModel.intervals[_intervalModel.currentIntervalIndex];
      } else {
        _intervalModel.remainingSeconds--;
      }
      notifyListeners();
    });
  }

  void stopCountdown() {
    _timer?.cancel();
    _intervalModel.isRunning = false;
    notifyListeners();
  }

  void resetCountdown() {
    stopCountdown();
    _intervalModel.reset();
    notifyListeners();
  }

  void addInterval(TextEditingController controller) {

    _intervalModel.intervals.add(10);
    notifyListeners();
  }

  void removeLastInterval() {
    if (intervalModel.intervals.isNotEmpty) {
      intervalModel.intervals.removeLast();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

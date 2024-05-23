// lib/models/interval_model.dart
class IntervalModel {
  int remainingSeconds;
  List<int> intervals;
  int currentIntervalIndex;
  bool isRunning;

  IntervalModel({
    required this.remainingSeconds,
    required this.intervals,
    required this.currentIntervalIndex,
    required this.isRunning,
  });

  void reset() {
    currentIntervalIndex = 0;
    remainingSeconds = intervals[currentIntervalIndex];
    isRunning = false;
  }
}

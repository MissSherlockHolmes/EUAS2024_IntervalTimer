// This will define the structure of a timer session.
class TimerModel {
  int workTime;
  int restTime;
  int repeatCount;

  TimerModel({this.workTime, this.restTime, this.repeatCount});

  // Method to convert TimerModel to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'workTime': workTime,
      'restTime': restTime,
      'repeatCount': repeatCount,
    };
  }
}

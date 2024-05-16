class TimerModel {
  int? workTime;
  int? restTime;
  String? id; // Unique ID for Firestore

  TimerModel({this.workTime, this.restTime, this.id});

  // Convert TimerModel to Map for Firebase
  Map<String, dynamic> toMap() {
    return {
      'workTime': workTime,
      'restTime': restTime,
    };
  }

  // Create a TimerModel from a Firestore document
  factory TimerModel.fromFirestore(Map<String, dynamic> firestore) {
    return TimerModel(
      workTime: firestore['workTime'],
      restTime: firestore['restTime'],
      id: firestore['id'],
    );
  }
}

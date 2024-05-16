import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interval_timer/models/timer_model.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveTimer(TimerModel timer) async {
    await _db.collection('timers').add(timer.toMap());
  }

  Stream<List<TimerModel>> getTimers() {
    return _db.collection('timers').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => TimerModel.fromFirestore(doc.data())).toList();
    });
  }
}

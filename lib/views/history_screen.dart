import 'package:flutter/material.dart';
import 'package:interval_timer/models/timer_model.dart';
import 'package:interval_timer/services/firebase_service.dart';

class HistoryScreen extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer History'),
      ),
      body: StreamBuilder<List<TimerModel>>(
        stream: _firebaseService.getTimers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No timers found"));
          }
          var timers = snapshot.data!;
          return ListView.builder(
            itemCount: timers.length,
            itemBuilder: (context, index) {
              TimerModel timer = timers[index];
              return ListTile(
                title: Text('Work: ${timer.workTime} sec, Rest: ${timer.restTime} sec'),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:interval_timer/services/firebase_service.dart';
import 'package:interval_timer/models/timer_model.dart';


class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _restController = TextEditingController();

  void _saveTimer() {
    var newTimer = TimerModel(
      workTime: int.parse(_workController.text),
      restTime: int.parse(_restController.text),
    );
    _firebaseService.saveTimer(newTimer).then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Timer saved!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save timer: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _workController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Work Time (seconds)',
          ),
        ),
        TextField(
          controller: _restController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Rest Time (seconds)',
          ),
        ),
        ElevatedButton(
          onPressed: _saveTimer,
          child: Text('Save Timer'),
        ),
      ],
    );
  }
}

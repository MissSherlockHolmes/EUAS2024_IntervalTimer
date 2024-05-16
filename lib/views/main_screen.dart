import 'package:flutter/material.dart';
import 'package:interval_timer/widgets/timer_widget.dart';
import 'package:interval_timer/views/history_screen.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interval Timer'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: TimerWidget(),
    );
  }
}

// lib/views/timer_list_screen.dart
import 'package:flutter/material.dart';
import 'countdown_timer_page.dart';

class TimerListScreen extends StatelessWidget {
  final List<List<int>> timers = [
    [15, 30, 40],
    [10, 5, 6],
    [10,8,9]
  ]; // Example timers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer List'),
      ),
      body: ListView.builder(
        itemCount: timers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Timer ${index + 1}: ${timers[index].join('-')}'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CountdownTimerPage(
                    timerName: 'Timer ${index + 1}',
                    showBackButton: false,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// saved_intervals_screen.dart
import 'package:flutter/material.dart';

class SavedIntervalsScreen extends StatelessWidget {
  final List<String> savedIntervals;
  final Function(List<String>) fillIntervalsCallback; // Callback function to fill intervals in CountdownTimerPage

  SavedIntervalsScreen({Key? key, required this.savedIntervals, required this.fillIntervalsCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Intervals'),
      ),
      body: ListView.builder(
        itemCount: savedIntervals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(savedIntervals[index]),
            onTap: () {
              // Split saved interval string into individual values
              List<String> intervals = savedIntervals[index].split('-');
              // Call the callback function to fill the intervals in CountdownTimerPage
              fillIntervalsCallback(intervals);
              // Navigate back to the CountdownTimerPage
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}

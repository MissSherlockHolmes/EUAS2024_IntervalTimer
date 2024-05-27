// saved_intervals_screen.dart
import 'package:flutter/material.dart';

class SavedIntervalsScreen extends StatelessWidget {
  final List<String> savedIntervals;

  SavedIntervalsScreen({Key? key, required this.savedIntervals}) : super(key: key);

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
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer History'),
      ),
      body: Center(
        child: Text('List of previous timers will be displayed here'),
      ),
    );
  }
}

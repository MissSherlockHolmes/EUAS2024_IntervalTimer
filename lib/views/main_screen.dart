import 'package:flutter/material.dart';

import '../widgets/timer_widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interval Timer'),
      ),
      body: Center(
        child: TimerWidget(),
      ),
    );
  }
}

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/countdown_controller.dart';
import 'views/countdown_timer_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountdownController(),
      child: MaterialApp(
        title: 'Countdown Timer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CountdownTimerPage(timerName: 'Default Timer', showBackButton: false),
      ),
    );
  }
}
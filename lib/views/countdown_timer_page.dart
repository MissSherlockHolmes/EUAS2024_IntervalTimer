// lib/views/countdown_timer_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/countdown_controller.dart';
import 'timer_list_screen.dart';

class CountdownTimerPage extends StatelessWidget {
  final List<TextEditingController> _controllers = [TextEditingController()];
  final String timerName;
  final bool showBackButton;

  CountdownTimerPage({Key? key, required this.timerName, required this.showBackButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(timerName),
        leading: showBackButton
            ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        )
            : null,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TimerListScreen()),
              );
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Consumer<CountdownController>(
                  builder: (context, controller, child) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _controllers.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextField(
                                controller: _controllers[index],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter interval ${index + 1} (seconds)',
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${controller.intervalModel.remainingSeconds}',
                          style: TextStyle(fontSize: 48),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () => controller.startCountdown(_controllers),
                              child: Text('Start'),
                            ),
                            ElevatedButton(
                              onPressed: controller.intervalModel.isRunning ? null : controller.resumeCountdown,
                              child: Text('Resume'),
                            ),
                            ElevatedButton(
                              onPressed: controller.stopCountdown,
                              child: Text('Stop'),
                            ),
                            ElevatedButton(
                              onPressed: controller.resetCountdown,
                              child: Text('Reset'),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            FloatingActionButton(
              heroTag: 'unique_tag_for_fab_in_timer_list_screen',
              onPressed: _controllers.length < 5 ? () {
                _controllers.add(TextEditingController());
                context.read<CountdownController>().addInterval(_controllers.last);
              } : null,
              tooltip: 'Add Interval',
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: 'unique_tag_for_fab_inlalalalalalala',
              onPressed: () {
                if (_controllers.isNotEmpty) {
                  _controllers.removeLast();
                  context.read<CountdownController>().removeLastInterval();
                }
              },
              tooltip: 'Remove Last Interval',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}

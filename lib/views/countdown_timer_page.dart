// countdown_timer_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/countdown_controller.dart';
import 'saved_intervals_screen.dart'; // Import the saved intervals screen

class CountdownTimerPage extends StatefulWidget {
  final String timerName;
  final bool showBackButton;

  CountdownTimerPage({Key? key, required this.timerName, required this.showBackButton}) : super(key: key);

  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  final List<TextEditingController> _controllers = [TextEditingController()];
  List<String> savedIntervals = []; // Track saved intervals

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.timerName),
        leading: widget.showBackButton
            ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        )
            : null,
        actions: [],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the screen displaying saved intervals, passing the callback function to fill intervals
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SavedIntervalsScreen(savedIntervals: savedIntervals, fillIntervalsCallback: _fillIntervals),
                      ),
                    );
                  },
                  child: Text('View Saved Intervals'),
                ),
              ],
            ),
            SizedBox(height: 16), // Added for spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _saveIntervals,
                  child: Text('Save'),
                ),
                SizedBox(width: 16), // Added for spacing
                FloatingActionButton(
                  heroTag: 'unique_tag_for_fab_in_timer_list_screen',
                  onPressed: _addInterval,
                  tooltip: 'Add Interval',
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 16), // Added for spacing
                FloatingActionButton(
                  heroTag: 'unique_tag_for_fab_inlalalalalalala',
                  onPressed: _removeInterval,
                  tooltip: 'Remove Last Interval',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveIntervals() {
    final List<String> intervals = _controllers.map((controller) => controller.text).where((text) => text.isNotEmpty).toList();
    final String intervalsString = intervals.join('-');
    print('Intervals: $intervalsString');
    setState(() {
      savedIntervals.add(intervalsString); // Add saved intervals to the list
    });
  }

  void _addInterval() {
    if (_controllers.length < 5) {
      setState(() {
        _controllers.add(TextEditingController());
      });
    }
  }

  void _removeInterval() {
    if (_controllers.length > 1) {
      setState(() {
        _controllers.removeLast();
      });
    }
  }

  void _fillIntervals(List<String> intervals) {
    setState(() {
      // Clear existing controllers and add new ones based on intervals
      _controllers.clear();
      for (var interval in intervals) {
        _controllers.add(TextEditingController(text: interval));
      }
    });
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

class pomodoroTimer extends StatefulWidget {
  const pomodoroTimer({super.key});

  @override
  State<pomodoroTimer> createState() => _pomodoroTimerState();
}

class _pomodoroTimerState extends State<pomodoroTimer> {
  static const int maxSeconds = 25 * 60;
  int _seconds = maxSeconds;
  Timer? _timer;

  void _startTimer() {
    if (_timer != null) return; // Prevent multiple timers
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _stopTimer();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _timer = null;
    });
  }

  void _resetTimer() {
    _stopTimer();
    setState(() => _seconds = maxSeconds);
  }

  @override
  void dispose() {
    _timer?.cancel(); // Clean up timer when leaving page
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    String seconds = (_seconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0A5BFF), Color(0xFF1E90FF), Color(0xFF63D4FF)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$minutes:$seconds",
                  style: const TextStyle(fontSize: 80, color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _timer == null ? _startTimer : _stopTimer,
                    child: Text(_timer == null ? "START" : "PAUSE"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: _resetTimer, child: const Text("RESET")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
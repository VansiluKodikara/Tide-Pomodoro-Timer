import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: pomodoroTimer(),
  ));
}

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
    if (_timer != null) return;
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
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    String seconds = (_seconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A5BFF), Color(0xFF1E90FF), Color(0xFF63D4FF)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.asset(
                'assets/img/wave.gif',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "$minutes:$seconds",
              style: const TextStyle(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF0A5BFF),
                  ),
                  onPressed: _timer == null ? _startTimer : _stopTimer,
                  child: Text(
                    _timer == null ? "START" : "PAUSE",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(width: 20),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _resetTimer,
                  child: const Text("RESET"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
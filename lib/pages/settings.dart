import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pages/pomodoroTimer.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => pomodoroTimer(),
                ),
            );
          },
            icon: Icon(
              Icons.close_rounded,
              color: Colors.white,
              textDirection: TextDirection.ltr,
              ),
            ),
            title: Text("Settings"),
            titleTextStyle: TextStyle(
              color: Colors.white,
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF0A5BFF),
          ),

        // body: Center(
        //   child: Container(
        //     width: 100.0,
        //     height: 100.0,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       border: Border.all(
        //         color: Colors.grey,
        //         width: 1.0,
        //       ),
        //     ),
        //   ),
        // ),

    );
  }
}

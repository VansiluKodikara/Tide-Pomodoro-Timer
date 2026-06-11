import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pages/createAccount.dart';
import 'package:pomodoro_timer/pages/home.dart';

class getStarted extends StatefulWidget {
  const getStarted({super.key});

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BackgroundGifScreen(),
    );
  }
}

class BackgroundGifScreen extends StatelessWidget {
  const BackgroundGifScreen({super.key});

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
                      builder: (context) => home(),
                  ),
              );
            },
            icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                textDirection: TextDirection.ltr,
            ),
        ),
      backgroundColor: Colors.transparent,
    ),

      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/img/wave_animation.gif',
              fit: BoxFit.cover,
            ),
          ),

          Column(
            verticalDirection: VerticalDirection.down,
            children: [
              SafeArea(
                child: Center(
                  child: Text(
                    'Master your time with a splash of serenity, \nWith soothing water sounds that keep your focus sharp, \nAnd your mind calm.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => createAccount(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        minimumSize: const Size(double.infinity, 80),
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF0A5BFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text("Next"),
                            Icon(Icons.arrow_forward_ios),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
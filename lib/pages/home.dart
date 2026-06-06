import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pomodoro_timer/pages/emailPage.dart';
import 'package:pomodoro_timer/pages/getStarted.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,

      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0A5BFF),
                    Color(0xFF1E90FF),
                    Color(0xFF63D4FF),
                  ],
                ),
              ),

              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    children: [
                      const Spacer(flex: 2),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          'assets/img/logo.png',
                          height: 120,
                        ),
                      ),


                      const SizedBox(height: 40),

                      const Text(
                        "Making your time, \nMore efficient",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(flex: 3),

                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => getStarted(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 80),
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF0A5BFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text("Get Started"),
                      ),

                      SizedBox(height: 30),

                      OutlinedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => emailPage(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          minimumSize: const Size(double.infinity, 80),
                          backgroundColor: Colors.white.withOpacity(0.5),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text("Already have an account?"),
                      ),

                      SizedBox(height: 15),

                      const Text(
                        "Copyright Tide App. All rights reserved.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
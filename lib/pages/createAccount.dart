import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pages/getStarted.dart';
import 'package:pomodoro_timer/pages/emailPage.dart';

class createAccount extends StatefulWidget {
  const createAccount({super.key});

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => getStarted(),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const Spacer(flex: 2),

                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(40),
                              child: Image.asset(
                                  "assets/img/accountlogo.png",
                                  height: 120,
                              ),
                            ),

                            const SizedBox(height: 40),

                            const Text(
                                "Create an account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),

                            const Spacer(flex: 3),

                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child:
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => emailPage(),
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
                                        child: Row(
                                          children: [
                                            Icon(Icons.email_rounded),
                                            const SizedBox(width: 5),
                                            Text("Continue with Email"),
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
              ),
            ],
          ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pomodoro_timer/pages/getStarted.dart';

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
                        padding: const EdgeInsets.symmetric(horizontal: 100),
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

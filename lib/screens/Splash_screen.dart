import 'package:flutter/material.dart';
import 'dart:async';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 1200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace this with your actual icon
              Image.asset(
                'assets/icon/list.png',
                width: 100,
                height: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Text(
                'TODO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
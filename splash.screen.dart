import 'package:flutter/material.dart';
import 'package:somthing/image/customimages.dart';
import 'dart:async';

import 'welcom.screen.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 seconds ke liye delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contaxt) => WelcomeScreen(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(splashScreen.splashScreenimages),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
          context, MaterialPageRoute(builder: ((context) => App()))),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextLiquidFill(
          loadDuration: Duration(seconds: 4),
          text: 'Water Timer',
          boxHeight: MediaQuery.of(context).size.height,
          boxWidth: MediaQuery.of(context).size.width,
          waveColor: Color.fromRGBO(30, 108, 140, 1),
          boxBackgroundColor: Color.fromARGB(255, 162, 225, 255),
          textStyle: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

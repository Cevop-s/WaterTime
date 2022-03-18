import 'package:flutter/material.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          title: const Text(
            'Settings',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Color(0xFF0B6E95), //#0B6E95
        ),
        body: Container(
          color: Colors.white,
          child: Text("Slaw Settings"),
        ));
  }
}

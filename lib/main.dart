import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_time_mobile_app/Screens/app.dart';
import 'Screens/MainScreens/HomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: App(),
      ),
    );
  });
}

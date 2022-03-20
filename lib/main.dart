import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_time_mobile_app/Screens/app.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EasyLocalization(
          saveLocale: true,
          path: 'assets/Translation',
          supportedLocales: [
            Locale('en', 'US'),
            Locale('ar'),
            Locale('kr'),
          ],
          child: App(),
        ),
      ),
    );
  });
}

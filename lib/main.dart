import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_time_mobile_app/Screens/LoadingScreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:water_time_mobile_app/State%20Manager/AppManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) {
      runApp(
        EasyLocalization(
          saveLocale: true,
          path: 'assets/Translation',
          supportedLocales: const [
            Locale("en", "US"),
            Locale("ar", "IQ"),
            Locale("ar", "EG")
          ],
          child: Phoenix(
            child: ChangeNotifierProvider(
              create: (context) => ThemeManager(),
              builder: (context, aaa) {
                var thememanager = Provider.of<ThemeManager>(context);
                return MaterialApp(
                  themeMode: thememanager.thememode,
                  theme: MyThemes.LightTheme,
                  darkTheme: MyThemes.DarkTheme,
                  debugShowCheckedModeBanner: false,
                  home: SplashScreen(),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}

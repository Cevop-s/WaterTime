import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  String? ageValue;
  String? languageValue;
  String? heightValue;
  String? weightValue;

  var language = ['English', 'کوردی', 'العربي'];

  var age = [for (var i = 12; i <= 100; i++) i.toString()];

  var Height = [for (var i = 50; i <= 250; i++) i.toString() + ' CM'];
  var Weight = [for (var i = 20; i <= 250; i++) i.toString() + ' KG'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: SettingsList(
                lightTheme:
                    SettingsThemeData(settingsListBackground: Colors.white),
                sections: [
                  SettingsSection(
                    title: Text("App Setting".tr(),
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.grey)),
                    tiles: <SettingsTile>[
                      SettingsTile(
                        title: Text(
                          "Language".tr(),
                          style: TextStyle(fontSize: 16),
                        ),
                        leading: Icon(
                          Icons.language,
                          size: 20,
                        ),
                        trailing: Center(
                          child: CustomDropdownButton2(
                            icon: FaIcon(FontAwesomeIcons.chevronDown),
                            hint: 'Select Language'.tr(),
                            dropdownItems: language,
                            value: languageValue,
                            onChanged: (value) {
                              setState(() {
                                languageValue = value;

                                EasyLocalization.of(context)!
                                    .setLocale(const Locale("ar"));
                              });
                            },
                          ),
                        ),
                      ),
                      SettingsTile.switchTile(
                        onToggle: (value) {},
                        initialValue: false,
                        leading: Icon(Icons.sunny, size: 20),
                        title: Text('Change the theme'.tr(),
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  SettingsSection(
                      title: Text("Update Profile Info".tr(),
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.grey)),
                      tiles: <SettingsTile>[
                        SettingsTile(
                          title:
                              Text("Age".tr(), style: TextStyle(fontSize: 16)),
                          leading: FaIcon(FontAwesomeIcons.user, size: 20),
                          trailing: Center(
                            child: CustomDropdownButton2(
                              icon: FaIcon(FontAwesomeIcons.chevronDown),
                              hint: 'Select Your age'.tr(),
                              dropdownItems: age,
                              value: ageValue,
                              onChanged: (value) {
                                setState(() {
                                  ageValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SettingsTile(
                          title: Text("Height".tr(),
                              style: TextStyle(fontSize: 16)),
                          leading: Icon(Icons.height, size: 20),
                          trailing: Center(
                            child: CustomDropdownButton2(
                              icon: FaIcon(FontAwesomeIcons.chevronDown),
                              hint: 'Select Height'.tr(),
                              dropdownItems: Height,
                              value: heightValue,
                              onChanged: (value) {
                                setState(() {
                                  heightValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SettingsTile(
                          title: Text("Weight".tr(),
                              style: TextStyle(fontSize: 16)),
                          leading: Icon(Icons.monitor_weight_rounded, size: 20),
                          trailing: Center(
                            child: CustomDropdownButton2(
                              icon: FaIcon(FontAwesomeIcons.chevronDown),
                              hint: 'Select Weight'.tr(),
                              dropdownItems: Weight,
                              value: weightValue,
                              onChanged: (value) {
                                setState(() {
                                  weightValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ]),
                  SettingsSection(
                    title: Text("Set Reminder".tr(),
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.grey)),
                    tiles: <SettingsTile>[],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

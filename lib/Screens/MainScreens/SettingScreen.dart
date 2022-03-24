import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:water_time_mobile_app/Constants/constants.dart";

class settingScreen extends StatefulWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: Scaffold(
        body: SafeArea(
          child: CupertinoScrollbar(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SettingsList(
                  lightTheme:
                      SettingsThemeData(settingsListBackground: Colors.white),
                  sections: [
                    SettingsSection(
                      title: Text("App Setting".tr(),
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF7A7A7A))),
                      tiles: <SettingsTile>[
                        SettingsTile(
                          title: Text(
                            "Language".tr(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0C6E95)),
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
                                });

                                if (value == "English") {
                                  setState(() {
                                    EasyLocalization.of(context)!
                                        .setLocale(const Locale('en', 'US'));
                                  });
                                } else if (value == "العربي") {
                                  setState(() {
                                    EasyLocalization.of(context)!
                                        .setLocale(const Locale('ar', 'IQ'));
                                  });
                                } else if (value == "کوردی") {
                                  setState(() {
                                    EasyLocalization.of(context)!
                                        .setLocale(const Locale('ar', 'EG'));
                                  });
                                } else {
                                  setState(() {
                                    EasyLocalization.of(context)!
                                        .setLocale(const Locale('en', 'US'));
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                        SettingsTile.switchTile(
                          onToggle: (value) {},
                          initialValue: false,
                          leading: Icon(Icons.sunny, size: 20),
                          title: Text(
                            'Change the theme'.tr(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0C6E95)),
                          ),
                        ),
                      ],
                    ),
                    SettingsSection(
                        title: Text("Update Profile Info".tr(),
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF7A7A7A))),
                        tiles: <SettingsTile>[
                          SettingsTile(
                            title: Text(
                              "Age".tr(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0C6E95)),
                            ),
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
                            title: Text(
                              "Height".tr(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0C6E95)),
                            ),
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
                            title: Text(
                              "Weight".tr(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0C6E95)),
                            ),
                            leading:
                                Icon(Icons.monitor_weight_rounded, size: 20),
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
                          SettingsTile(
                            title: Text(
                              "Gender".tr(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0C6E95)),
                            ),
                            leading: FaIcon(FontAwesomeIcons.person, size: 20),
                            trailing: Center(
                              child: CustomDropdownButton2(
                                icon: FaIcon(FontAwesomeIcons.chevronDown),
                                hint: 'Select Weight'.tr(),
                                dropdownItems: gender,
                                value: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ]),
                    SettingsSection(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Set Reminder".tr(),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xFF7A7A7A))),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(6),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 25,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      tiles: <SettingsTile>[
                        SettingsTile(
                            title: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width,
                          height: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 206, 206, 206), //New
                                blurRadius: 10.0,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

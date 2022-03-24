import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:water_time_mobile_app/Constants/constants.dart";

class settingScreen extends StatefulWidget {
  settingScreen({
    Key? key,
  }) : super(key: key);

  settingScreen.changeValue({
    this.value = false,
  });

  late bool value = true;

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  Alignment switchControlAlignment = Alignment.centerLeft;
  //bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                              "Age",
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
                            children: [
                              Container(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.decelerate,
                                          width: 45,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              color: widget.value
                                                  ? Colors.greenAccent
                                                  : Colors.redAccent),
                                          child: AnimatedAlign(
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              alignment: widget.value
                                                  ? Alignment.centerRight
                                                  : Alignment.centerLeft,
                                              curve: Curves.decelerate,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: Container(
                                                  width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0)),
                                                ),
                                              )),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            widget.value = !widget.value;
                                          });
                                        },
                                      ),
                                      Container(
                                        height: 50,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "08:30 AM",
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "roboto",
                                                      fontSize: 22),
                                                ),
                                                Text("Every Monday",
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: "roboto",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.more_horiz,
                                  ))
                            ],
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

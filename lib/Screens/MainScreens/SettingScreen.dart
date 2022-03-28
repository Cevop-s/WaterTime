import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:water_time_mobile_app/Constants/constants.dart";
import 'package:toggle_switch/toggle_switch.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:water_time_mobile_app/State%20Manager/AppManager.dart';

// ignore: must_be_immutable
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

  bool isChecked = false;

  int genderint = 0;
  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);
  bool iosStyle = true;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                                        .setLocale(const Locale('en', 'US'))
                                        .then(
                                          (_) => {Phoenix.rebirth(context)},
                                        );
                                  });
                                } else if (value == "العربي") {
                                  setState(() {
                                    EasyLocalization.of(context)!
                                        .setLocale(const Locale('ar', 'IQ'))
                                        .then(
                                          (_) => {Phoenix.rebirth(context)},
                                        );
                                  });
                                } else if (value == "کوردی") {
                                  setState(() {
                                    EasyLocalization.of(context)!
                                        .setLocale(const Locale('ar', 'EG'))
                                        .then(
                                          (_) => {Phoenix.rebirth(context)},
                                        );
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
                          initialValue: theme.isDark,
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
                            trailing: ToggleSwitch(
                              minHeight: 30,
                              minWidth: 80.0,
                              fontSize: 10,
                              iconSize: 15,
                              animate: true,
                              animationDuration: 300,
                              initialLabelIndex: genderint,
                              cornerRadius: 15.0,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey.shade300,
                              inactiveFgColor: Colors.black.withOpacity(0.6),
                              totalSwitches: 2,
                              labels: ['Male', 'Female'],
                              icons: [
                                FontAwesomeIcons.person,
                                FontAwesomeIcons.personDress
                              ],
                              activeBgColors: [
                                [Color(0xFF0C6E95)],
                                [Color(0xFF0C6E95)]
                              ],
                              onToggle: (index) {
                                genderint = index!;
                                genderValue = gender[genderint];
                                print(genderValue);
                              },
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
                              primary: Color(0xFF0C6E95),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(6),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 25,
                            ),
                            onPressed: () {
                              openDialog();
                            },
                          ),
                        ],
                      ),
                      tiles: <SettingsTile>[
                        SettingsTile(
                            title: Column(children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: MediaQuery.of(context).size.width,
                            height: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.decelerate,
                                            width: 45,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color: widget.value
                                                    ? Color(0xFF0C6E95)
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
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                                      overflow:
                                                          TextOverflow.fade,
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
                                      color: Color(0xFF0C6E95),
                                    )),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Color.fromARGB(255, 206, 206, 206), //New
                                  blurRadius: 10.0,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ]))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: 200,
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 18,
                    child: ClipRRect(
                      child:
                          Image.asset('assets/reminder.png', fit: BoxFit.fill),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Set Reminder",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(showPicker(
                        okText: "Set",
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Set a time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF0C6E95)),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Time Set",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  InkWell(
                    onTap: () {
                      openRepeat();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Set a Repeat",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF0C6E95)),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Time Set",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 35),
                                primary: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: Text("Cancle"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF0C6E95),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text("Set Reminder"),
                          onPressed: () {},
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      );
  Future openRepeat() => showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) => Dialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 200,
              height: 300,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  CheckboxListTile(
                    title: Text("Every Day"),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                  Container(
                    width: 220,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 160,
                    width: 250,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                              child: CheckboxListTile(
                                title: Text("Every Saturday"),
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: CheckboxListTile(
                                title: Text("Every Sunday"),
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: CheckboxListTile(
                                title: Text("Every Monday"),
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: CheckboxListTile(
                                title: Text("Every Tuesday"),
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: CheckboxListTile(
                                title: Text("Every Wednesday"),
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: CheckboxListTile(
                                title: Text("Every Thursday"),
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: CheckboxListTile(
                                title: Text("Every Friday"),
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                              ),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancle")),
                    TextButton(onPressed: () {}, child: Text("Set")),
                  ])
                ]),
              ),
            ),
          ),
        ),
      );
}

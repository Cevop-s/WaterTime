import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  String dropdownvalue = 'English';

  var items = ['English', 'Kurdish'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),

        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Color(0xFF0B6E95), //#0B6E95
      ),
      body: Container(
        child: SettingsList(
          lightTheme: SettingsThemeData(settingsListBackground: Colors.white),
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile(
                  title: Text("Language"),
                  leading: Icon(Icons.language),
                  trailing: DropdownButton(
                      value: dropdownvalue,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      }),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: false,
                  leading: Icon(Icons.sunny),
                  title: Text('Change the theme'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

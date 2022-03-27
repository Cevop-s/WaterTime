import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//import 'package:water_time_mobile_app/screens/bottom_navigation.dart';
import 'package:water_time_mobile_app/Screens/MainScreens/HomePage.dart';
import 'package:water_time_mobile_app/Screens/MainScreens/ProgressScreen.dart';
import 'package:water_time_mobile_app/Screens/MainScreens/SettingScreen.dart';
//import 'package:water_time_mobile_app/screens/tab_item.dart';
//import 'package:water_time_mobile_app/screens/tab_navigator.dart';
import 'package:easy_localization/easy_localization.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  //var _currentTab = TabItem.home;
  // final _navigatorKeys = {
  //   TabItem.home: GlobalKey<NavigatorState>(),
  //   TabItem.progress: GlobalKey<NavigatorState>(),
  //   TabItem.settings: GlobalKey<NavigatorState>(),
  // };

  // void _selectTab(TabItem tabItem) {
  //   if (tabItem == _currentTab) {
  //     // pop to first route
  //     _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
  //   } else {
  //     setState(() => _currentTab = tabItem);
  //   }
  // }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 40, fontWeight: FontWeight.w600);

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProgressPage(),
    settingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EasyLocalization(
        saveLocale: true,
        path: 'assets/Translation',
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'IQ'),
          Locale('ar', 'EG'),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          appBar: _selectedIndex == 0
              ?

              // Symetric Padding

              AppBar(
                  elevation: 0,
                  title: Text(
                    'Water'.tr(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  //shadowColor: Colors.transparent,
                  foregroundColor: Color(0xFF0B6E95), //#0B6E95
                )
              : null,
          body: _widgetOptions.elementAt(_selectedIndex),
          // Stack(children: <Widget>[
          //   _buildOffstageNavigator(TabItem.home),
          //   _buildOffstageNavigator(TabItem.progress),
          //   _buildOffstageNavigator(TabItem.settings),
          // ]),
          bottomNavigationBar:

              // FloatingNavbar(
              //   onTap: (int val) => setState(() => _selectedIndex = val),
              //   currentIndex: _selectedIndex,
              //   items: [
              //     FloatingNavbarItem(icon: Icons.home, title: 'Home'),
              //     FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
              //     FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
              //     FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
              //   ],
              // )

              // );

              Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 25),
                child: GNav(
                  //rippleColor: Colors.grey[300]!,
                  rippleColor: Colors.transparent,
                  hoverColor: Colors.grey[100]!,

                  backgroundColor: Colors.transparent,
                  // gap: 0.00000000000000000000001,

                  activeColor: Colors.white,
                  iconSize: 25,
                  //padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Color(0xFF1A6483), //1A6483 //#1A6483
                  color: Colors.black,

                  tabs: [
                    GButton(
                      icon: Icons.water_drop_outlined,
                      text: 'Home'.tr(),

                      //text: 'Hs',
                    ),
                    GButton(
                      icon: Icons.local_drink_rounded,
                      text: 'Progress'.tr(),
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Settings'.tr(),
                    ),
                  ],
                  selectedIndex: _selectedIndex,

                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                      //TabItem.values[index];
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

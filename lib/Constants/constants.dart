import 'package:easy_localization/easy_localization.dart';

var months = [
  "January".tr(),
  "Febuary".tr(),
  "March".tr(),
  "April".tr(),
  "May".tr(),
  "June".tr(),
  "July".tr(),
  "August".tr(),
  "September".tr(),
  "November".tr(),
  "October".tr(),
  "December".tr()
];

String? ageValue;
String? languageValue;
String? heightValue;
String? weightValue;
String? genderValue;

var language = ['English', 'کوردی', 'العربي'];
var gender = ['Male', 'Female'];
var age = [for (var i = 12; i <= 100; i++) i.toString()];

var Height = [for (var i = 50; i <= 250; i++) i.toString() + ' CM'];
var Weight = [for (var i = 20; i <= 250; i++) i.toString() + ' KG'];
var Remaining = "Remaining".tr();

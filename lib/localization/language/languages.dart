import 'package:flutter/material.dart';

abstract class Languages {

  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  String get appName;

  String get userHome;

  String get userHolidayList;

  String get userLeaveApply;

  String get userProfile;

  String get closeCashCounter;

  String get login;

  String get registerDevice;

  String get userName;

  String get password;

  String get registrationInProgress;

  String get somethingWentWrong;

  String get pleaseEnterUserName;

  String get pleaseEnterPassword;




}

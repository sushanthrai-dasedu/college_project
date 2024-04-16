import 'package:flutter/material.dart';

abstract class Languages {

  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  String get appName;

  String get cashCounter;

  String get receipts;

  String get reports;

  String get profile;

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

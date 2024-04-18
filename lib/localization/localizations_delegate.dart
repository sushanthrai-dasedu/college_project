
import 'package:flutter/material.dart';


import 'language/language_en.dart';
import 'language/language_kn.dart';
import 'language/languages.dart';
import 'language_data.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => LanguageData.getSupportedLocale().contains(locale);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'kn':
        return LanguageKn();

      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}

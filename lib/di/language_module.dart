import 'dart:ui';

import 'package:injectable/injectable.dart';

class UserLanguage {
  final String name;
  UserLanguage({required this.name});

  factory UserLanguage.english() => UserLanguage(name: "en");
  factory UserLanguage.spanish() => UserLanguage(name: "es");
  factory UserLanguage.portuguese() => UserLanguage(name: "pt");
}

const supportedLocales = [Locale('en', ''), Locale('es', ''), Locale('pt', '')];

@module
abstract class LanguageModule {
  UserLanguage getUserLanguage() {
    final locale = window.locale.languageCode;
    if (locale.contains('pt')) {
      return UserLanguage.portuguese();
    } else {
      return locale.contains('es')
          ? UserLanguage.spanish()
          : UserLanguage.english();
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalisationService {
  final Locale locale;

  LocalisationService(this.locale);

  static LocalisationService? of(BuildContext context) {
    return Localizations.of<LocalisationService>(context, LocalisationService);
  }

  Map<String, String>? _localizedString;

  Future<bool> load() async {
    String jsonStr = await rootBundle
        .loadString("assets/languages/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonStr);

    _localizedString = jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );

    return true;
  }

  String translate(String key) {
    return _localizedString![key] ?? "";
  }

  static const LocalizationsDelegate<LocalisationService> delegate =
      _LocalisationService();
}

class _LocalisationService extends LocalizationsDelegate<LocalisationService> {
  const _LocalisationService();

  @override
  bool isSupported(Locale locale) {
    return ["en", "fr"].contains(locale.languageCode);
  }

  @override
  Future<LocalisationService> load(Locale locale) async {
    LocalisationService appLocalizations = LocalisationService(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalisationService> old) {
    return false;
  }
}

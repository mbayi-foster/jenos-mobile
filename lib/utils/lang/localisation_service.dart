import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalisationService {
  final Locale locale;

  LocalisationService(this.locale);

  static LocalisationService? of(BuildContext context) {
    return Localizations.of<LocalisationService>(context, LocalisationService);
  }

  Map<String, dynamic>? _localizedString;

  Future<bool> load() async {
    String jsonStr = await rootBundle
        .loadString("assets/languages/${locale.languageCode}.json");
    _localizedString = jsonDecode(jsonStr);
    return true;
  }

  String translate(String key) {
    List<String> keys = key.split('.');
    dynamic value = _localizedString;

    for (String k in keys) {
      if (value is Map<String, dynamic>) {
        value = value[k];
      } else {
        return "";
      }
    }

    return value?.toString() ?? "";
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
import 'package:flutter/material.dart';
import 'package:jenos_app/main.dart';
import 'package:jenos_app/utils/lang/localisation_service.dart'; // Assurez-vous d'importer votre service de localisation

extension StringLocalization on String {
  String get myTr {
    // Récupérer le BuildContext par le moyen de la méthode 'of'
    final context =
        LocalisationService.of(NavigationService.navigatorKey.currentContext!);
    return context?.translate(this) ??
        this; // Retourner la traduction ou la clé par défaut
  }
}

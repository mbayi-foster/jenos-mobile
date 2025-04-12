import 'package:flutter/material.dart';

extension SizeExtensions on num {
  // Retourne un SizedBox avec une hauteur proportionnelle
  SizedBox get ph {
    return SizedBox(
      height: toDouble(),
    );
  }

  // Retourne un SizedBox avec une largeur proportionnelle
  SizedBox get pw {
    return SizedBox(width: toDouble());
  }
}

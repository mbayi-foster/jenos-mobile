class Place {
  String? nom;
  double? lat;
  double? long;
  Place({this.nom, this.lat, this.long});

  Map<String, dynamic> toJson() => {"adresse": nom, "lat": lat, "lon": long};
}

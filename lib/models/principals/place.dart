class Place {
  String? nom;
  double? lat;
  double? long;
  String? commune;
  Place({this.nom, this.commune, this.lat, this.long});

  factory Place.fromJson(Map<String, dynamic> json) => Place(
      lat: (json['lat'] != null)
          ? double.tryParse(json['lat'].toString()) ?? 0.0
          : 0.0,
      long: (json['lon'] != null)
          ? double.tryParse(json['lon'].toString()) ?? 0.0
          : 0.0,
      nom: json['adresse'] ?? "",
      commune: json['commune'] ?? "");
  Map<String, dynamic> toJson() =>
      {"adresse": nom, "commune": commune, "lat": lat, "lon": long};
}

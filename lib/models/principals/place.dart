class Place {
  String? nom;
  double? lat;
  double? long;
  Place({this.nom, this.lat, this.long});

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        lat: (json['lat'] != null)
            ? double.tryParse(json['lat'].toString()) ?? 0.0
            : 0.0,
        long: (json['lon'] != null)
            ? double.tryParse(json['lon'].toString()) ?? 0.0
            : 0.0,
        nom: json['adresse'] ?? "",
      );
  Map<String, dynamic> toJson() => {"adresse": nom, "lat": lat, "lon": long};
}

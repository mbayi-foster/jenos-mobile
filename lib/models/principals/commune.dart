class Commune {
  int id;
  String nom;
  String zone;
  double frais;

  Commune(
      {required this.id,
      required this.nom,
      required this.zone,
      required this.frais});

  factory Commune.fromJson(Map<String, dynamic> json) => Commune(
      id: json['id'] ?? 0,
      nom: json['nom'] ?? "",
      zone: json['zone'] ?? "",
      frais: json["frais"] != null ? json['frais'].toDouble() : 0.0);
}

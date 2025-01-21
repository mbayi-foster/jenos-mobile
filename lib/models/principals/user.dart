// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);


import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int id;
    String nom;
    String prenom;
    String email;
    double phone;
    String photo;
    bool status;
    DateTime createdAt;

    User({
        required this.id,
        required this.nom,
        required this.prenom,
        required this.email,
        required this.phone,
        this.photo = "",
        required this.status,
        required this.createdAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nom: json["nom"],
        prenom: json["prenom"],
        email: json["email"],
        phone: json["phone"].toDouble(),
        photo: json["photo"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "phone": phone,
        "photo": photo,
        "status": status,
        "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    };
}

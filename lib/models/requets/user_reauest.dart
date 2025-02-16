import 'dart:convert';
String userRequestToJson(UserRequest data) => json.encode(data.toJson());

class UserRequest {
    String nom;
    String prenom;
    String email;
    int phone;
    String adresse;
    String password;

    UserRequest({
        required this.nom,
        required this.prenom,
        required this.email,
        required this.phone,
        required this.adresse,
        required this.password,
    });
    Map<String, dynamic> toJson() => {
        "nom": nom,
        "prenom": prenom,
        "email": email,
        "phone": phone,
        "adresse": adresse,
        "password": password,
    };
}

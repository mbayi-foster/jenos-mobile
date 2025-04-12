import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:jenos_app/models/principals/user.dart';
import 'package:jenos_app/api/locale/auth_service_local_impl.dart';

class ApiService {
  var baseUrl = dotenv.env['BASE_URL'] ?? "";
  
  Future<String?> _getToken() async {
    AuthServiceLocalImpl api = AuthServiceLocalImpl();
    User? user = await api.getUser();

    return user!.token;
  }

  Future<dynamic> get(String endpoint) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: token != null ? {'Authorization': 'Bearer $token'} : {},
    );

    _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final token = await _getToken();
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );

    return _handleResponse(response);
  }

  Future<dynamic> delete(String endpoint) async {
    final token = await _getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: token != null ? {'Authorization': 'Bearer $token'} : {},
    );

    return _handleResponse(response);
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Erreur API: ${response.statusCode} - ${response.body}');
    }

    return jsonDecode(response.body); // Retourne la réponse décodée
  }
}

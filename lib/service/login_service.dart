import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final String apiUrl = 'http://192.168.1.19:8000/api/login';
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', responseData['token']);
        await prefs.setString('user_data', jsonEncode(responseData['user']));
        return responseData;
      } else {
        return {
          'success': false,
          'message': responseData['message'] ?? 'Login Gagal'
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Tidak bisa terhubung ke server'};
    }
  }
  Future<bool> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    try {
      final response = await http.post(
        Uri.parse('http://10.16.17.46:8000/api/logout'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        await prefs.remove('auth_token');
        return true;
      }
      return false;
    } catch (e) {
      // Jika server mati, kita tetap hapus token di lokal agar user bisa keluar
      await prefs.remove('auth_token');
      return true;
    }
  }
}
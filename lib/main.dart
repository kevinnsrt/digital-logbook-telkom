import 'package:digital_logbook_telkom/landing.dart'; // Halaman Login/Landing
import 'package:digital_logbook_telkom/dashboard.dart'; // Ganti dengan path Dashboard asli kamu
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telkom Digital Logbook',
      debugShowCheckedModeBanner: false,
      // Kita gunakan AuthGate sebagai gerbang utama
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  // Fungsi untuk mengecek token secara asinkron
  Future<String?> _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _checkToken(),
      builder: (context, snapshot) {
        // 1. Saat masih loading mengecek memori HP
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 2. Jika token ditemukan (User sudah login)
        if (snapshot.hasData && snapshot.data != null) {
          // Ganti dengan class Dashboard kamu yang ada di video tadi
          return const DashboardPage();
        }

        // 3. Jika token kosong (User belum login/sudah logout)
        return LandingPage();
      },
    );
  }
}
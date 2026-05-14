import 'package:digital_logbook_telkom/auth/login.dart';
import 'package:digital_logbook_telkom/colors/colors.dart';
import 'package:digital_logbook_telkom/landing.dart';
import 'package:digital_logbook_telkom/main.dart';
import 'package:digital_logbook_telkom/service/login_service.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoggingOut = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: // Contoh pada tombol Logout
        IconButton(
          icon: isLoggingOut
              ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)
          )
              : const Icon(Icons.logout),
          onPressed: isLoggingOut ? null : () async { // Disable tombol saat loading
            setState(() {
              isLoggingOut = true;
            });

            bool success = await LoginService().logout();

            if (success) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthGate()),
                      (route) => false
              );
            } else {
              setState(() {
                isLoggingOut = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Gagal Logout, coba lagi")),
              );
            }
          },
        )
      ),
    );
  }
}

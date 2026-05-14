import 'dart:convert';

import 'package:digital_logbook_telkom/colors/colors.dart';
import 'package:digital_logbook_telkom/dashboard.dart';
import 'package:digital_logbook_telkom/main.dart';
import 'package:digital_logbook_telkom/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscuretext = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // container form
            Container(
              height: 210,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text("Login",style: TextStyle(fontSize: 24),),

                  // email
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder()
                    ),
                  ),

                  // password
                  TextField(
                    controller: passwordController,
                    obscureText: obscuretext,
                    decoration: InputDecoration(
                        label: Text("Password"),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            obscuretext = !obscuretext;
                          });
                        },
                          icon: Icon(
                            obscuretext ? Icons.visibility_off_outlined : Icons.visibility
                        ),),
                        border: OutlineInputBorder()
                    ),
                  )
                ],
              ),
            ),

            // button login
            SizedBox(
              height: 45,
              width: 350,
              child:
              ElevatedButton(onPressed: () async{
                print(emailController.text);
                print(passwordController.text);

                if(emailController.text.isEmpty || passwordController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Harap Isi Email dan Password"))
                  );
                }else{
                  final result = await LoginService().login(
                    emailController.text,
                    passwordController.text,
                  );

                  if (result['success'] == true) {
                    // Login Berhasil

                    // buat simpan data user ke dalam memory
                    // panggilnya pas butuh tinggal decode aja
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? userString = prefs.getString('user_data');

                    if (userString != null) {
                      Map<String, dynamic> user = jsonDecode(userString);
                      String username = '';
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Welcome $username"),));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const AuthGate()),
                      );
                    }

                  } else {
                    // Login Gagal, tampilkan SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result['message'])),
                    );
                  }
                }


              // Navigator.pushReplacement(context, MaterialPageRoute<void>(builder: (context)=> DashboardPage()));
              }, child: Text("Masuk",style: TextStyle(fontSize: 18),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12))
                ),),
            ),
          ],
        ),
      )),
    );
  }
}

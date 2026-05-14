import 'package:digital_logbook_telkom/auth/login.dart';
import 'package:digital_logbook_telkom/colors/colors.dart';
import 'package:digital_logbook_telkom/dashboard.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //   nnti pake image assets
          Image.network('https://upload.wikimedia.org/wikipedia/commons/2/22/Telkom_Indonesia_logo.png',
          width: 250, height: 250,
          ),
            Text("Digital Logbook RSO",style: TextStyle(fontSize: 28),),
            Text("Telkom Regional I",style: TextStyle(fontSize: 20),),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child:
        //   button masuk
      ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute<void>(builder: (context)=> LoginPage()));
      }, child: Text("Masuk",style: TextStyle(fontSize: 20),),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20))
      ),
      ),),
    );
  }

}

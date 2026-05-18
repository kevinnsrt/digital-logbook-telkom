import 'package:digital_logbook_telkom/colors/colors.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Notifikasi"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // gap
            SizedBox(
              height: 12,
            ),

            // Card
            Container(
              width: 375,
              height: 55,
              child: Card(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  //   gap
                    SizedBox(
                      width: 12,
                    ),
                  // message
                  Text("John meminta dokumen ....",
                  style:
                  TextStyle(fontSize:18 ),),
                    
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       IconButton(onPressed: (){
                         //   nanti isi kalau nerima request
                       }, icon: Icon(Icons.close)),

                       IconButton(onPressed: (){
                       //   nanti isi kalau nerima request
                       }, icon: Icon(Icons.check)),

                     ],
                   ), 
                  ],
                )
            ),),
            Container(
              width: 375,
              height: 55,
              child: Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //   gap
                      SizedBox(
                        width: 12,
                      ),
                      // message
                      Text("John meminta dokumen ....",
                        style:
                        TextStyle(fontSize:18 ),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            //   nanti isi kalau nerima request
                          }, icon: Icon(Icons.close)),

                          IconButton(onPressed: (){
                            //   nanti isi kalau nerima request
                          }, icon: Icon(Icons.check)),

                        ],
                      ),
                    ],
                  )
              ),),
            Container(
              width: 375,
              height: 55,
              child: Card(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //   gap
                      SizedBox(
                        width: 12,
                      ),
                      // message
                      Text("John meminta dokumen ....",
                        style:
                        TextStyle(fontSize:18 ),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            //   nanti isi kalau nerima request
                          }, icon: Icon(Icons.close)),

                          IconButton(onPressed: (){
                            //   nanti isi kalau nerima request
                          }, icon: Icon(Icons.check)),

                        ],
                      ),
                    ],
                  )
              ),)
          ],
        )
      )),
    );
  }
}

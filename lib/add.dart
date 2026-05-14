import 'package:digital_logbook_telkom/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddDocumentPage extends StatefulWidget {
  const AddDocumentPage({super.key});

  @override
  State<AddDocumentPage> createState() => _AddDocumentPageState();
}

class _AddDocumentPageState extends State<AddDocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Tambah Dokumen NPK"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // gap atas
            SizedBox(
              height: 32,
            ),
            // text field + title
            Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text("Judul NPK",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  TextField(
                    decoration: InputDecoration(
                        label: Icon(Icons.file_copy),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text("CC",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  TextField(
                    decoration: InputDecoration(
                        label: Icon(Icons.account_circle),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text("Mitra",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  TextField(
                    decoration: InputDecoration(
                        label: Icon(Icons.apartment),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text("Jumlah",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      label: Icon(Icons.attach_money),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                  ),
                ],
              ),
            ),

          // gap
            SizedBox(
              height: 20,
            ),

          //   container button
            Container(
              width: 200,
              height: 62,
              child: ElevatedButton(onPressed: (){
              //   nanti panggil service api untuk create dokumen
              }, child: Text("Simpan Data",style: TextStyle(fontSize: 18),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12)
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

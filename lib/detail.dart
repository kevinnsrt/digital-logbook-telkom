import 'package:digital_logbook_telkom/colors/colors.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Detail"),
      ),
      body: Center(
        child:  Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // gap
              SizedBox(
                height: 16,
              ),
              // gap
              Text("Penyediaan Onsite Untuk Dinas Komunikasi Dan Informatika Kota Payakumbuh 2025",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
              // gap
              SizedBox(
                height: 16,
              ),
              // gap

              // container detail
              Container(
                padding: EdgeInsetsGeometry.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("CC: DINAS KOMUNIKASI DAN INFORMATIKA KOTA PAYAKUMBUH",style: TextStyle(fontSize: 14),),
                    Text("MITRA: KOPEGTEL AGRESIF",style: TextStyle(fontSize: 14),),
                    Text("LAYANAN: Desember 2025",style: TextStyle(fontSize: 14),),
                    Text("TAGIHAN: Rp 5.450.240",style: TextStyle(fontSize: 14),),

                  ],
                ),


              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: ElevatedButton(onPressed: (){}, child: Text("Ambil"),style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),),
      ),
    );
  }
}

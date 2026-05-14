import 'package:digital_logbook_telkom/add.dart';
import 'package:digital_logbook_telkom/colors/colors.dart';
import 'package:digital_logbook_telkom/detail.dart';
import 'package:digital_logbook_telkom/notification.dart';
import 'package:digital_logbook_telkom/profile.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: const Text('Cari NPK'),
                  content: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        )
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        // disini nanti tempat ngirim data pada field search bar
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('Cari'),
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.search,color: Colors.black,),
        ),
        title: Text('Digital NPK Logbook RSO',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body:
      Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                // percontainer itu card untuk setiap dokumen (nanti buat pake gesture detector yg tap biar bisa di klik ke detailnya)
                Container(
                  width: 370,
                  height: 240,
                  color: Colors.white,
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
                          ],
                        ),
                      ),

                      // gap
                      SizedBox(
                        height: 16,
                      ),
                      // gap
                      // row untuk 2 button horizontal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 25,
                        children: [
                          // button detail
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){
                              // Navigator.push(context,MaterialPageRoute<void>(builder: (context) => DetailPage()));
                              _gotodetailpage();
                            }, child: Text("Detail"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white60,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                          // button ambil
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){}, child: Text("Ambil"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 370,
                  height: 240,
                  color: Colors.white,
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
                          ],
                        ),
                      ),

                      // gap
                      SizedBox(
                        height: 16,
                      ),
                      // gap
                      // row untuk 2 button horizontal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 25,
                        children: [
                          // button detail
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){
                              // Navigator.push(context,MaterialPageRoute<void>(builder: (context) => DetailPage()));
                              _gotodetailpage();
                            }, child: Text("Detail"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white60,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                          // button ambil
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){}, child: Text("Ambil"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 370,
                  height: 240,
                  color: Colors.white,
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
                          ],
                        ),
                      ),

                      // gap
                      SizedBox(
                        height: 16,
                      ),
                      // gap
                      // row untuk 2 button horizontal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 25,
                        children: [
                          // button detail
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){
                              // Navigator.push(context,MaterialPageRoute<void>(builder: (context) => DetailPage()));
                              _gotodetailpage();
                            }, child: Text("Detail"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white60,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                          // button ambil
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){}, child: Text("Ambil"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 370,
                  height: 240,
                  color: Colors.white,
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
                          ],
                        ),
                      ),

                      // gap
                      SizedBox(
                        height: 16,
                      ),
                      // gap
                      // row untuk 2 button horizontal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 25,
                        children: [
                          // button detail
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){
                              // Navigator.push(context,MaterialPageRoute<void>(builder: (context) => DetailPage()));
                              _gotodetailpage();
                            }, child: Text("Detail"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white60,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                          // button ambil
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){}, child: Text("Ambil"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 370,
                  height: 240,
                  color: Colors.white,
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
                          ],
                        ),
                      ),

                      // gap
                      SizedBox(
                        height: 16,
                      ),
                      // gap
                      // row untuk 2 button horizontal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 25,
                        children: [
                          // button detail
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){
                              // Navigator.push(context,MaterialPageRoute<void>(builder: (context) => DetailPage()));
                              _gotodetailpage();
                            }, child: Text("Detail"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white60,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                          // button ambil
                          SizedBox(
                            width: 157,
                            height: 43,
                            child: ElevatedButton(onPressed: (){}, child: Text("Ambil"),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
      // di bottom navbar juga iconnya dibuat gesture detector biar bisa di klik untuk ke menu list, home atau notifikasi
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            GestureDetector(
              onTap: (){
                _gotonotificationpage();
              },
              child: Icon(Icons.notifications,size: 42,),
            ),
            // button add
            GestureDetector(
              onTap: (){
                _gotoaddpage();
              },
              child: Icon(Icons.add,size: 42,),
            ),
            GestureDetector(
              onTap: (){
                _gotoprofilepage();
              },
              child: Icon(Icons.person,size: 42,),
            ),
          ],
        ),
      ),
    );
  }
  // fungsi pergi ke detail dokumen
  _gotodetailpage(){
    Navigator.push(context, MaterialPageRoute<void>(builder: (context)=> DetailPage()));
  }

  // fungsi pergi ke halaman tambah dokumen
  _gotoaddpage(){
    Navigator.push(context, MaterialPageRoute<void>(builder: (context)=> AddDocumentPage()));
  }

  _gotonotificationpage(){
    Navigator.push(context, MaterialPageRoute<void>(builder: (context)=> NotificationPage()));
  }

  _gotoprofilepage(){
    Navigator.push(context, MaterialPageRoute<void>(builder: (context)=> ProfilePage()));
  }
}


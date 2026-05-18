import 'package:digital_logbook_telkom/add.dart';
import 'package:digital_logbook_telkom/colors/colors.dart';
import 'package:digital_logbook_telkom/main.dart';
import 'package:digital_logbook_telkom/notification.dart';
import 'package:digital_logbook_telkom/service/get_documents_service.dart';
import 'package:digital_logbook_telkom/service/login_service.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<List<dynamic>> futureDocuments;
  bool isLoggingOut = false;
  @override

  void initState() {
    super.initState();
    futureDocuments = GetDocumentService().fetchDocuments();
  }

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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Bikin pojokan dialog lebih tumpul
                  backgroundColor: Colors.white,
                  title: const Row(
                    children: [
                      SizedBox(width: 10),
                      Text('Cari Dokumen NPK', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  content: TextField(
                    autofocus: true, // Otomatis keyboard naik pas dialog muncul
                    decoration: InputDecoration(
                      hintText: "Masukkan judul atau nomor NPK...", // Kasih petunjuk
                      prefixIcon: const Icon(Icons.description_outlined), // Icon di dalam field
                      filled: true,
                      fillColor: Colors.grey[100], // Background field agak abu biar kontras
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none, // Hilangkan border default agar lebih clean
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Batal', style: TextStyle(color: Colors.grey[600])),
                    ),
                    // Gunakan ElevatedButton di aksi biar tombol "Cari" lebih menonjol
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika pencarian kamu
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text('Cari'),
                      ),
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
      FutureBuilder<List<dynamic>>(
        future: futureDocuments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Gagal memuat data: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data NPK"));
          }

          // 3. Jika data ada, tampilkan ListView
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data![index];
              return Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20), // Spacing antar card
                  width: 370,
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12), // Biar lebih manis
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          doc['title'] ?? "Judul Tidak Ada", // Dinamis dari database
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("CC: ${doc['customer'] ?? '-'}", style: const TextStyle(fontSize: 14)),
                            Text("MITRA: ${doc['mitra'] ?? '-'}", style: const TextStyle(fontSize: 14)),
                            Text("LAYANAN: ${doc['bulan_layanan'] ?? '-'}", style: const TextStyle(fontSize: 14)),
                            Text("Status: ${doc['status'] ?? '-'}", style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 25,
                        children: [
                          // Button Ambil
                          SizedBox(
                            width: 330,
                            height: 43,
                            child: ElevatedButton(
                              onPressed: doc['status'] == 'taken' ? null : () {
                                // Fungsi ambil dokumen nanti di sini
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: doc['status'] == 'taken' ? Colors.grey : Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Text(doc['status'] == 'taken' ? "Sudah Diambil" : "Ambil"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
            IconButton(
              icon: isLoggingOut
                  ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black)
              )
                  : const Icon(Icons.logout_outlined,size: 38,color: Colors.black,),
              onPressed: () async { // Disable tombol saat loading
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
          ],
        ),
      ),
    );
  }
  // fungsi pergi ke halaman tambah dokumen
  _gotoaddpage(){
    Navigator.push(context, MaterialPageRoute<void>(builder: (context)=> AddDocumentPage()));
  }

  _gotonotificationpage(){
    Navigator.push(context, MaterialPageRoute<void>(builder: (context)=> NotificationPage()));
  }

}


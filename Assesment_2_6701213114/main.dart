import 'package:flutter/material.dart';

class MyWireframeLayout extends StatefulWidget {
  @override
  _MyWireframeLayoutState createState() => _MyWireframeLayoutState();
}

class _MyWireframeLayoutState extends State<MyWireframeLayout> {
  int kondisiValue = 1; // Nilai default untuk kondisi

  bool isInCityDelivery = false;
  bool isReturnAccepted = false;
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController hargaController = TextEditingController();

  void navigateToSecondScreen() {
    String namaBarang = namaBarangController.text;
    String deskripsi = deskripsiController.text;
    String harga = hargaController.text;
    String kondisi = kondisiValue == 1 ? 'Bekas' : 'Baru';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(
          namaBarang: namaBarang,
          deskripsi: deskripsi,
          harga: harga,
          kondisi: kondisi,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wireframe Layar utama'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // View Pertama
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: namaBarangController,
                decoration: InputDecoration(
                  hintText: 'Nama Barang',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
            ),

            SizedBox(height: 16.0),

            // View Kedua
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: deskripsiController,
                decoration: InputDecoration(
                  hintText: 'Deskripsi',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
                minLines: 4,
                maxLines: null,
              ),
            ),

            SizedBox(height: 16.0),

            // View Ketiga
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: hargaController,
                decoration: InputDecoration(
                  hintText: 'Harga',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
            ),

            SizedBox(height: 16.0),

            // View Keempat
            Text('Kondisi Barang'),

            SizedBox(height: 16.0),

            // View Kelima dan Keenam (Radio Buttons)
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: kondisiValue,
                  onChanged: (value) {
                    setState(() {
                      kondisiValue = value as int;
                    });
                  },
                ),
                Text('Bekas'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: kondisiValue,
                  onChanged: (value) {
                    setState(() {
                      kondisiValue = value as int;
                    });
                  },
                ),
                Text('Baru'),
              ],
            ),

            SizedBox(height: 16.0),

            // Switch Pengiriman dalam kota saja
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pengiriman dalam kota saja'),
                Switch(
                  value: isInCityDelivery,
                  onChanged: (value) {
                    setState(() {
                      isInCityDelivery = value ?? false;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 16.0),

            // Switch Menerima retur
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Menerima retur'),
                Switch(
                  value: isReturnAccepted,
                  onChanged: (value) {
                    setState(() {
                      isReturnAccepted = value ?? false;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 16.0),

            // Tombol "PUBLIKASIKAN" dengan padding top 100
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: ElevatedButton(
                onPressed: navigateToSecondScreen,
                child: Text('PUBLIKASIKAN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String namaBarang;
  final String deskripsi;
  final String harga;
  final String kondisi;

  const SecondScreen({
    required this.namaBarang,
    required this.deskripsi,
    required this.harga,
    required this.kondisi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layar Kedua'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Nama barang: $namaBarang'),
            Text('Deskripsi: $deskripsi'),
            Text('Harga: $harga'),
            Text('Jenis barang: $kondisi'),
            SizedBox(height: 16.0),
            Text('Pengiriman dalam kota saja: Tidak'),
            Text('Menerima retur: Ya'),
            SizedBox(height: 16.0),
            Text('Dikerjakan oleh: 6701213114- Iskandar Sani'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyWireframeLayout(),
  ));
}

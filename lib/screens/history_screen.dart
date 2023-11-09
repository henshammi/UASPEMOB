import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String dataFromDetailPage = ""; // Variabel untuk menyimpan data dari DetailPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Data from DetailPage:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              dataFromDetailPage,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke DetailPage dan tunggu data kembali
                _navigateToDetailPage(context);
              },
              child: Text('Go to DetailPage'),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menavigasi ke DetailPage
  _navigateToDetailPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailPage()),
    );

    // Update dataFromDetailPage dengan data yang dikirim kembali dari DetailPage
    setState(() {
      dataFromDetailPage = result ?? ""; // default value jika result null
    });
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Detail Page Content',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kirim data kembali ke HistoryPage
                Navigator.pop(context, 'Data dari DetailPage');
              },
              child: Text('Send Data to HistoryPage'),
            ),
          ],
        ),
      ),
    );
  }
}

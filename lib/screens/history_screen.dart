import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String dataFromDetailPage =
      ""; // Variabel untuk menyimpan data dari DetailPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Data from DetailPage:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              dataFromDetailPage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke DetailPage dan tunggu data kembali
                _navigateToDetailPage(context);
              },
              child: const Text('Go to DetailPage'),
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
      MaterialPageRoute(builder: (context) => const DetailPage()),
    );

    // Update dataFromDetailPage dengan data yang dikirim kembali dari DetailPage
    setState(() {
      dataFromDetailPage = result ?? ""; // default value jika result null
    });
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Detail Page Content',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kirim data kembali ke HistoryPage
                Navigator.pop(context, 'data has been sent...');
              },
              child: const Text('Send Data to HistoryPage'),
            ),
          ],
        ),
      ),
    );
  }
}

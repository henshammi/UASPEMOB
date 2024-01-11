// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CRUD_Screen extends StatefulWidget {
//   const CRUD_Screen({Key? key}) : super(key: key);

//   @override
//   State<CRUD_Screen> createState() => _CRUD_ScreenState();
// }

// class _CRUD_ScreenState extends State<CRUD_Screen> {
//   // Variable untuk menyimpan data text
//   String text = "";

//   // Variable untuk menyimpan ID data text
//   int id = 0;

//   // Referensi ke Firestore database
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   // List untuk menyimpan data text
//   List<TextModel> texts = [];

//   @override
//   void initState() {
//     super.initState();

//     // Baca data text dari database
//     read();
//   }

//   // Fungsi untuk membuat text baru
//   void create() async {
//     // Validasi input
//     if (text.isEmpty) {
//       return;
//     }

//     // Simpan data text ke database
//     await firestore.collection('texts').add({'text': text});

//     // Tampilkan data text ke UI
//     read();
//   }

//   // Fungsi untuk membaca data text
//   void read() async {
//     // Ambil data text dari database
//     QuerySnapshot snapshot = await firestore.collection('texts').get();

//     // Bersihkan list data text
//     texts.clear();

//     // Tambahkan data text ke list
//     for (DocumentSnapshot doc in snapshot.docs) {
//       texts.add(TextModel.fromDocument(doc));
//     }

//     // Tampilkan data text ke UI
//     setState(() {});
//   }

//   // Fungsi untuk memperbarui data text
//   void update(int id) async {
//     // Validasi input
//     if (text.isEmpty) {
//       return;
//     }

//     // Perbarui data text di database
//     await firestore.collection('texts').doc(id.toString()).update({'text': text});

//     // Tampilkan data text ke UI
//     read();
//   }

//   // Fungsi untuk menghapus data text
//   void delete(int id) async {
//     // Hapus data text dari database
//     await firestore.collection('texts').doc(id.toString()).delete();

//     // Tampilkan data text ke UI
//     read();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("CRUD Text"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Input text
//             TextField(
//               controller: TextEditingController(text: text),
//               decoration: InputDecoration(
//                 labelText: "Text",
//               ),
//             ),

//             // Button create
//             TextButton(
//               onPressed: create,
//               child: Text("Create"),
//             ),

//             // List data text
//             ListView.builder(
//               itemCount: texts.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(texts[index].text),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           setState(() {
//                             id = texts[index].id;
//                             text = texts[index].text;
//                           });
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           delete(texts[index].id);
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


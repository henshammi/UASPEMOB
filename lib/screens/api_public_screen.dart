import 'package:aplikasipemob/model.dart';
import 'package:aplikasipemob/repository.dart';
import 'package:flutter/material.dart';

class Apipublic extends StatefulWidget {
  const Apipublic({Key? key}) : super(key: key);

  @override
  State<Apipublic> createState() => _ApipublicState();
}

class _ApipublicState extends State<Apipublic> {
  List<Album> listAlbum = [];
  Repository repository = Repository();

  getData() async {
    List<Album> albums = await repository.getData();
    setState(() {
      listAlbum = albums;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Language'),
      ),
      body: listAlbum.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    listAlbum[index]
                        .name, // Assuming 'name' is a property in your Album class
                    style: TextStyle(fontSize: 18.0),
                  ),
                  subtitle: Text(
                    'desc: ${listAlbum[index].name}', // Replace with the actual property
                    style: TextStyle(fontSize: 14.0),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: listAlbum.length,
            ),
    );
  }
}

import 'dart:convert';

import 'package:aplikasipemob/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://ce.judge0.com/languages/';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Album> album = it.map((e) => Album.fromJson(e)).toList();
        return album;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

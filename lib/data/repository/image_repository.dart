import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<String>> fetchImages(String query) async {
    // await Future.delayed(Duration(seconds: 2));

    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=31006923-d09ef30ce2d7fbb0f733b4c7e&q=$query&image_type=photo&pretty=true'));

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    final Iterable hits = json['hits'];

    return hits.map((e) => e['webformatURL'] as String).toList();

    // return [
    //   'https://pixabay.com/get/g65a59df4e171d18f4c9675063ccae3971ad390ba21cbc56497d66704b40348eb8e7a3058da063b3ce09362de284d1e7fc84192c2f69f9d5333a01ffc20d1b0a2_640.jpg',
    //   'https://pixabay.com/get/g59d5c2c4a7adbc887c43783e3c9bcd1bbf2b28039922a30f2bd9cf37a47574d1e403b29c34e4a46253105537732d7485c9bdcb3b835d5c6374e80500a8f34c9a_640.jpg',
    // ];
  }
}

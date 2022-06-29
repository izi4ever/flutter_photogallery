import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/img.dart';

class ImgProvider {
  Future<List<Img>> getImg() async {
    final response = await http.get(Uri.parse('https://izi4ever.github.io/flutter_photogallery/url.json'));

    if (response.statusCode == 200) {
      final List<dynamic> imgJson = json.decode(response.body);
      print(imgJson);
      return imgJson.map((e) => Img.fromJson(e)).toList();
    } else {
      throw Exception('Error fetching images');
    }
  }
}
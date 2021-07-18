import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/main.dart';

import 'package:newsapp/models/home_model.dart';
import 'package:newsapp/scoped_model/home_scoped_model.dart';

class HomeService {
  Future<Home> getNewsService(String category) async {
    try {
      if (category == null) {
        category = 'general';
      } else {
        category = HomeScopedModel.selectedCategory;
      }

      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?sortBy=publishedAt&category=$category&language=en&apiKey=2075b063336a440991b63d014f0d6850'));

      print('Selected category is : ' +
          category.toUpperCase() +
          ' =>' +
          ' ' +
          response.body);
      if (response.statusCode == 200) {
        var resp = Home.fromJson((jsonDecode(response.body)));
        return resp;
      } else {
        throw Exception('Error');
      }
    } catch (e) {}
  }
}

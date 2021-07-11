import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:newsapp/models/home_model.dart';

class HomeService {
  bool onClick;
  Future<Home> getNewsService() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2021-07-04&to=2021-07-04&sortBy=popularity&apiKey=2075b063336a440991b63d014f0d6850'));

    print(response.body);
    if (response.statusCode == 200) {
      var resp = Home.fromJson((jsonDecode(response.body)));
      onClick = true;
      return resp;
    } else {
      throw Exception('Error');
    }
  }
}

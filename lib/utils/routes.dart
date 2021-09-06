import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/home_model.dart';
import 'package:newsapp/pages/detailed_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/DetailedPage':
        //var selectedArticle = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => DetailedPage(
                  data: data,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

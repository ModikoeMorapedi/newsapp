import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/home_page.dart';
import 'scoped_model/home_scoped_model.dart';
import 'utils/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

HomeScopedModel homeScopedModel = HomeScopedModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeScopedModel>(
        model: homeScopedModel,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ));
  }
}
